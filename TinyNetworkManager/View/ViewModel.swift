//
//  ViewModel.swift
//  TinyNetworkManager
//
//  Created by Vinayak.gh on 08/09/21.
//

import Foundation

class ViewModel {
    
    func getListOfCountries(completion: @escaping([String]?, Error?) -> Void) {
        let request = CountriesRequest()
        
        //Initiate the execution here
        APIRequestManager.executeAPIRequest(request) { (countries, error) in
            if let countries = countries {
                //Handle the decoding of model seperately, wherever required (as of now it is handled here)
                APIRequestManager.toDecodedModelData(countries, modelType: Countries.self) { (countries) in
                    completion(countries?.countries ?? nil, nil)
                }
            }
            if error != nil {
                completion(nil, nil)
            }
        }
    }
}
