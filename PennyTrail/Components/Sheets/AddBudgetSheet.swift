//
//  AddBudgetSheet.swift
//  PennyTrail
//
//  Created by Allan on 12/24/24.
//

import SwiftUI

struct AddBudgetSheet: View {
    @Binding var isPresented: Bool
    @State private var categoryName: String = ""
    @State private var amount: String = ""
    @State private var themeColor: ThemeModel = ThemeModel(name: "Red", color: 0xFF0000)
    
    var budgetViewModel: BudgetsViewModel
    
    var body: some View {
        ScrollView{
            VStack(alignment: .leading){
                Text("Add New Budget").font(.title).fontWeight(.bold).padding()
                Text("Choose a category to set a spending budget. These categories can help you monitor spending").padding().foregroundStyle(Color(hex: 0x696868))
                Text("Category").padding(.horizontal).foregroundStyle(Color(hex: 0x696868))
                CustomDropDown(selectedCategory: $categoryName)
                Text("Amount").padding(.horizontal).foregroundStyle(Color(hex: 0x696868))
                TextField("e.g 1000", text: $amount).keyboardType(.decimalPad).autocorrectionDisabled().padding(.bottom).padding(.horizontal)
                Text("Theme").padding(.horizontal).foregroundStyle(Color(hex: 0x696868))
                ColorDropDown(selectedColor: $themeColor)
                Button{
                    budgetViewModel.addBudget(category: categoryName, spent: 0.0, max: Double(amount) ?? 0.0, theme: themeColor)
                    isPresented = false
                } label: {
                    Text("Add Budget").fontWeight(.bold).frame(maxWidth: .infinity)
                }.buttonStyle(.borderedProminent).tint(.black).padding(.bottom, 32).padding(.horizontal)
            }.textFieldStyle(.roundedBorder)
        }
    }
}

//#Preview {
//    AddBudgetSheet()
//}
