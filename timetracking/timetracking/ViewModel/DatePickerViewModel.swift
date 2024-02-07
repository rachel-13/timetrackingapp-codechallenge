//
//  DatePickerViewModel.swift
//  timetracking
//
//  Created by pohz on 06/02/2024.
//

import Foundation
import Combine
import CoreData

class DatePickerViewModel: ObservableObject {
    
    @Published var date: Date = Date.now
    
    let checkInTimeService: CheckInTimeServiceProtocol
    let managedContext = CoreDataStack.shared.persistentContainer.viewContext
    
    init(checkInTimeService: CheckInTimeServiceProtocol) {
        self.checkInTimeService = checkInTimeService
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
        
        let entity =  NSEntityDescription.entity(forEntityName: "Employee", in: managedContext)
        let item = NSManagedObject(entity: entity!, insertInto: managedContext)
        item.setValue(dateString, forKey: "check_in_date_time")
        do {
            try managedContext.save()
        } catch _ {
            print("Something went wrong.")
        }
        
        
    }
    
    func getDateFromCoreData() -> String? {
        let fetchRequest = Employee.fetchRequest()
        do {
            let fetchedResults = try managedContext.fetch(fetchRequest)
            let sortedResults = fetchedResults.sorted { lhs, rhs in
                guard let lhsVal = lhs.check_in_date_time, let rhsVal = rhs.check_in_date_time else {
                    return false
                }
                return lhsVal < rhsVal
            }
            let lastResult = sortedResults.last?.check_in_date_time
            return lastResult
        } catch let error as NSError {
            print(error.description)
        }
        
        return nil
    }
    
    func getDate() {
        guard let coreDataDateString = getDateFromCoreData(), let date = coreDataDateString.toDate() else {
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
