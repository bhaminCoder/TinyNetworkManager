//
//  APIRequestManager.swift
//  RandomDogGenerator
//
//  Created by Vinayak.Hejib on 07/09/21.
//  Copyright © 2020 Personal. All rights reserved.
//

import Foundation

class APIRequestManager {

    static func executeAPIRequest<T: APIRequest>(_ request: T, completion: @escaping(Data?, Error?) -> Void) {
        guard let urlRequest = URLRequest(request: request) else {
            return
        }

        //This condition is solely for the purpose of testing while passing-in the mocked data and error objects
        if request.data() != nil || request.error() != nil {
            completion(request.data(), request.error())
        }

        let task = request.urlSession().dataTask(with: urlRequest) { (data, _, error) in
            if let data = data {
                completion(data, nil)
            }
            if let error = error {
                completion(nil, error)
            }
        }
        task.resume()
    }

    //Decode and returns the data of a specific Codable modelType if valid,
    //Else returns nil
    static func toDecodedModelData<T>(_ data: Data, modelType: T.Type, completion: @escaping(T?) -> Void) where T: Decodable {
        let decoder = JSONDecoder()
        guard let modeldata = try? decoder.decode(modelType, from: data) else {
            NSLog("Invalid Model")
            completion(nil)
            return
        }
        completion(modeldata)
    }
}

extension URLRequest {

    init?<T: APIRequest>(request: T) {
        let urlString = (request.baseUrl()+request.path())
        guard  let relativeURL = URL(string: urlString) else {
            return nil
        }

        self.init(url: relativeURL)
        self.timeoutInterval = 30.0 //Assumption
        self.httpMethod = request.method()
    }
}
