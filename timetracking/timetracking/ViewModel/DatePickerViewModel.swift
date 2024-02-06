//
//  DatePickerViewModel.swift
//  timetracking
//
//  Created by pohz on 06/02/2024.
//

import Foundation
import Combine

protocol DatePickerViewModel {
    var date: String { get }
    func saveDate(date: String)
    func getDate() -> String
}

class DatePickerViewModelImpl: ObservableObject, DatePickerViewModel {
    
    @Published var date = ""
    
    func saveDate(date: String) {
        
    }
    
    func getDate() -> String {
        return ""
    }
}
