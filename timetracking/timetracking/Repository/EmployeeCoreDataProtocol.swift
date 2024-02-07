//
//  EmployeeCoreDataSource.swift
//  timetracking
//
//  Created by pohz on 07/02/2024.
//

import Foundation
import CoreData
 
protocol EmployeeCoreDataProtocol {
    func saveRecord(with date: String)
    func getRecord() -> String?
}

class EmployeeCoreDataSourceImpl: EmployeeCoreDataProtocol {
    
    let managedContext: NSManagedObjectContext
    
    init() {
        managedContext = CoreDataStack.shared.persistentContainer.viewContext
    }
    
    func saveRecord(with date: String) {
        let employee = Employee(context: managedContext)
        employee.check_in_date_time = date
        do {
            try managedContext.save()
        } catch (let err) {
            print(err.localizedDescription)
        }
    }
    
    func getRecord() -> String? {
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
        } catch (let err) {
            print(err.localizedDescription)
        }
        
        return nil
    }
}
