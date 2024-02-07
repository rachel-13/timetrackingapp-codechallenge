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
    let employeeCoreData: EmployeeCoreDataProtocol
    
    init(checkInTimeService: CheckInTimeServiceProtocol, employeeCoreData: EmployeeCoreDataProtocol) {
        self.checkInTimeService = checkInTimeService
        self.employeeCoreData = employeeCoreData
    }
    
    func saveDate() {
        let component = Calendar.current.dateComponents([.year, .month, .day, .hour, .minute], from: date)
        guard let year = component.year,
              let month = component.month,
              let day = component.day,
              let hour = component.hour,
              let minute = component.minute else {
            return
        }
        
        let dateString = String(format: "%d-%02d-%02d %02d:%02d", year, month, day, hour, minute)
        employeeCoreData.saveRecord(with: dateString)
    }
    
    func getDate() {
        guard let coreDataDateString = employeeCoreData.getRecord(), let date = coreDataDateString.toDate() else {
            getDateFromAPI()
            return
        }
        
        self.date = date
    }
    
    func getDateFromAPI(){
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
