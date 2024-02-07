//
//  DatePickerHostingController.swift
//  timetracking
//
//  Created by pohz on 05/02/2024.
//

import Foundation
import SwiftUI

@objc class DatePickerHostingController: NSObject {
    
    @objc static func create() -> UIViewController {
        let service = CheckInTimeService(networkService: NetworkServiceImpl())
        let coreData = EmployeeCoreDataSourceImpl()
        let viewModel = DatePickerViewModel(checkInTimeService: service, employeeCoreData: coreData)
        let datepickerView = DatePickerSwiftUIView(viewModel: viewModel)
        let hostingController = UIHostingController(rootView: datepickerView)
        
        return hostingController
    }
}
