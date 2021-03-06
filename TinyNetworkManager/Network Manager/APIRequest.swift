//
//  APIRequest.swift
//  RandomDogGenerator
//
//  Created by Vinayak.Hejib on 07/09/21.
//  Copyright © 2020 Personal. All rights reserved.
//

import Foundation

enum MethodType: String {
    case GET
    case POST
}

protocol APIRequest: class {
    associatedtype ModelType: Codable

    func baseUrl() -> String
    func path() -> String
    func method() -> MethodType

    func urlSession() -> URLSession

    //Below methods would be used solely for the purpose of testing/mocking
    func data() -> Data?
    func error() -> Error?
}

extension APIRequest {
    public func urlSession() -> URLSession {
        let sessionConfiguration = URLSessionConfiguration.default
        return URLSession(configuration: sessionConfiguration, delegate: nil, delegateQueue: .main)
    }
    
    public func data() -> Data? {
        return nil
    }
    
    public func error() -> Error? {
        return nil
    }
}
