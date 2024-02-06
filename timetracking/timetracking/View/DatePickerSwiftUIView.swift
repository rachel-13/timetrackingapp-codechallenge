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
            DatePicker(selection: $selectedDate, in: ...Date.now) {
                Text("Pick a date and time")
            }
            .frame(alignment: .center)
            .padding()
            
            Button("Submit") {
                print(selectedDate)
            }
            .padding()
        }
    }
}

#Preview {
    DatePickerSwiftUIView()
}
