//
//  CustomDatePicker.swift
//  PennyTrail
//
//  Created by Allan on 12/16/24.
//

import SwiftUI

struct CustomDatePicker: View {
    @State var selectedDate: Date
        
        var body: some View {
            VStack(alignment: .leading) {
                HStack {
                    DatePicker("Pick a date", selection: $selectedDate, displayedComponents: .date)
                        .datePickerStyle(.compact)
                        .labelsHidden()
                    
                    Spacer()
                    Image(systemName: "calendar")
                        .foregroundColor(.gray)
                }
                .padding()
                .background(Color(.systemGray6)) // Light background similar to the screenshot
                .cornerRadius(10) // Rounded corners
                .overlay(
                    RoundedRectangle(cornerRadius: 10)
                        .stroke(Color(.systemGray5), lineWidth: 1) // Subtle border
                )
            }
            .padding()
        }
}

//#Preview {
//    CustomDatePicker()
//}
