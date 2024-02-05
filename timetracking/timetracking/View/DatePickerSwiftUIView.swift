//
//  DatePickerSwiftUIView.swift
//  timetracking
//
//  Created by pohz on 05/02/2024.
//

import SwiftUI

struct DatePickerSwiftUIView: View {
    @State private var selectedDate = Date.now
    
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
