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
    var mockedResponseData: Data? { get set }
    func getRequest(path: String, completionHandler: @escaping (Result<Data, Error>) -> Void)
}

class NetworkServiceImpl: NetworkService {
    
    let baseURL = "https://some.api.com/"
    var mockedResponseData: Data?
    
    func getRequest(path: String, completionHandler: @escaping (Result<Data, Error>) -> Void) {
        
        DispatchQueue.global(qos: .userInteractive).async {
            if let response = self.mockedResponseData{
                completionHandler(.success(response))
            }
        }
        
    }
}
