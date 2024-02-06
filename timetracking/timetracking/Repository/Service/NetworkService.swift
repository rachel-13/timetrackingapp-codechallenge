//
//  NetworkService.swift
//  timetracking
//
//  Created by pohz on 06/02/2024.
//

import Foundation

enum NetworkError: Error {
    case unknown
}

protocol NetworkService {
    func getRequest(path: String, completionHandler: @escaping (Result<String, Error>) -> Void)
}

class NetworkServiceImpl: NetworkService {
    
    let baseURL = "https://some.api.com/"
    var mockedJSONResponse: String?
    
    func getRequest(path: String, completionHandler: @escaping (Result<String, Error>) -> Void) {
        
        DispatchQueue.global(qos: .userInteractive).async {
            if let response = self.mockedJSONResponse {
                completionHandler(.success(response))
            }
        }
        
    }
}
