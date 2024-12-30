//
//  CustomDropDown.swift
//  PennyTrail
//
//  Created by Allan on 12/16/24.
//

import SwiftUI

struct CustomDropDown: View {
    @Binding var selectedCategory: String
        let categories = ["Entertainment", "Bills", "Groceries", "Dinning Out",  "Food", "Travel", "Shopping", "Personal Care", "Lifestyle", "General", "Utilities", "Others"]
        
        var body: some View {
            VStack(alignment: .leading, spacing: 10) {
                Menu {
                    ForEach(categories, id: \.self) { category in
                        Button(action: {
                            selectedCategory = category
                        }) {
                            Text(category)
                        }
                    }
                } label: {
                    HStack {
                        Text(selectedCategory.isEmpty ? "Select a category" : selectedCategory)
                            .foregroundColor(selectedCategory.isEmpty ? .gray : .black)
                        
                        Spacer()
                        
                        Image(systemName: "chevron.down")
                            .foregroundColor(.gray)
                    }
                    .padding()
                    .cornerRadius(10)
                    .overlay(
                        RoundedRectangle(cornerRadius: 10)
                            .stroke(Color(.systemGray4), lineWidth: 1)
                    )
                }
            }
            .padding()
        }

}

//#Preview {
//    CustomDropDown()
//}
