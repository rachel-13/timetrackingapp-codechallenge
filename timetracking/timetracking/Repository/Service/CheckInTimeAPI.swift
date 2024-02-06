//
//  CheckInTimeAPI.swift
//  timetracking
//
//  Created by pohz on 06/02/2024.
//

import Foundation

protocol CheckInTimeAPI {
    func getCheckInTime(completionHandler: @escaping (String) -> Void)
}


class CheckInTimeEndpoint: CheckInTimeAPI {
    
    let networkService: NetworkService
    let path = "mock/api/check_in_date_time"
    
    init(networkService: NetworkService) {
        self.networkService = networkService
    }
    
    func getCheckInTime(completionHandler: @escaping (String) -> Void) {
        self.networkService.getRequest(path: self.path) { [weak self] result in
            guard let self = self else { return }
            switch result {
            case .success(let date):
                completionHandler(date)
            case .failure:
                // handle errors
                break
            }
        }
    }
    
}
