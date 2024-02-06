//
//  DatePickerViewModel.swift
//  timetracking
//
//  Created by pohz on 06/02/2024.
//

import Foundation
import Combine

class DatePickerViewModel: ObservableObject {
    
    @Published var date: Date = Date.now
    
    let checkInTimeService: CheckInTimeServiceProtocol
    
    init(checkInTimeService: CheckInTimeServiceProtocol) {
        self.checkInTimeService = checkInTimeService
    }
    
    func saveDate(date: String) {
        
    }
    
    func getDate(){
        self.checkInTimeService.getCheckInTime { [weak self] dateString in
            guard let self = self, let parsedDate = dateString.toDate() else {
                return
            }
            DispatchQueue.main.async {
                self.date = parsedDate
            }
        }
    }
}
