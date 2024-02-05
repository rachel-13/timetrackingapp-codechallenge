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
        let datepickerView = DatePickerSwiftUIView()
        let hostingController = UIHostingController(rootView: datepickerView)
        
        return hostingController
    }
}
