//
//  CheckInTimeAPI.swift
//  timetracking
//
//  Created by pohz on 06/02/2024.
//

import Foundation

protocol CheckInTimeServiceProtocol {
    func getCheckInTime(completionHandler: @escaping (String) -> Void)
}


class CheckInTimeService: CheckInTimeServiceProtocol {
    
    var networkService: NetworkService
    let path = "mock/api/check_in_date_time"
    
    init(networkService: NetworkService) {
        self.networkService = networkService
        
        let component = Calendar.current.dateComponents([.year, .month, .day], from: Date.now)
        guard let year = component.year, let month = component.month, let day = component.day else {
            return
        }
        let mockedString = String(format:  "{\"dateTime\": \"%d-%02d-%02d 06:30\"}", year, month, day)
        self.networkService.mockedResponseData =  mockedString.data(using: .utf8)
    }
    
    func getCheckInTime(completionHandler: @escaping (String) -> Void) {
        self.networkService.getRequest(path: self.path) { result in
            switch result {
            case .success(let data):
                do {
                    let checkInTime = try JSONDecoder().decode(CheckInTime.self, from: data)
                    completionHandler(checkInTime.dateTime)
                } catch (let err) {
                    print("decoding error \(err)")
                }
            case .failure:
                // handle errors
                break
            }
        }
    }
    
}
