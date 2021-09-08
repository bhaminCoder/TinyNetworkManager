//
//  CountriesRequest.swift
//  TinyNetworkManager
//
//  Created by Vinayak.gh on 08/09/21.
//

import Foundation

class CountriesRequest: APIRequest {

    typealias ModelType = Countries
    
    func baseUrl() -> String {
        return "https://tinynetwirkmanager.free.beeceptor.com"
    }
    
    func path() -> String {
        return "/my/api/countries"
    }
    
    func method() -> MethodType {
        return .GET
    }
}
