//
//  DatePickerSwiftUIView.swift
//  timetracking
//
//  Created by pohz on 05/02/2024.
//

import SwiftUI

struct DatePickerSwiftUIView: View {
    
    @ObservedObject var viewModel: DatePickerViewModel
    
    var body: some View {
        VStack {
            DatePicker(selection: $viewModel.date, in: ...Date.now) {
                Text("Pick a date and time")
            }
            .frame(alignment: .center)
            .padding()
            
            Button("Submit") {
                viewModel.saveDate()
            }
            .padding()
        }.onAppear(perform: {
            viewModel.getDate()
        })
    }
}

#Preview {
    class MockCheckInService: CheckInTimeServiceProtocol {
        func getCheckInTime(completionHandler: @escaping (String) -> Void) {
            completionHandler("2023-12-01 06:45")
        }
    }
    
    return DatePickerSwiftUIView(viewModel: DatePickerViewModel(checkInTimeService: MockCheckInService()))
}
