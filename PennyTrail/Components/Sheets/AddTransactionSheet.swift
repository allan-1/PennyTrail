//
//  AddTransactionSheet.swift
//  PennyTrail
//
//  Created by Allan on 12/16/24.
//

import SwiftUI

struct AddTransactionSheet: View {
    @Binding var isPresented: Bool
    @State private var transactionName: String = ""
    @State private var categoryName: String = ""
    @State private var date = Date()
    @State private var amount: String = ""
    @State private var isOn = false
    
    var transactionViewModel: TransactionViewModel

    var body: some View {
        ScrollView{
            VStack(alignment: .leading){
                Text("Add New Transaction").font(.title).fontWeight(.bold).padding()
                Text("Transaction Name").padding(.horizontal).foregroundStyle(Color(hex: 0x696868))
                TextField("e.g Urban Services Hub", text: $transactionName).autocorrectionDisabled().padding(.bottom).padding(.horizontal)
                Text("Transaction Date").padding(.horizontal).foregroundStyle(Color(hex: 0x696868))
                CustomDatePicker(selectedDate: date)
                Text("Category").padding(.horizontal).foregroundStyle(Color(hex: 0x696868))
                CustomDropDown(selectedCategory: $categoryName)
                Text("Amount").padding(.horizontal).foregroundStyle(Color(hex: 0x696868))
                TextField("e.g 1000", text: $amount).keyboardType(.decimalPad).autocorrectionDisabled().padding(.bottom).padding(.horizontal)
                HStack{
                    Text("Recurring").foregroundStyle(Color(hex: 0x696868))
                    Toggle("", isOn: $isOn).toggleStyle(iOSCheckboxToggleStyle())
                }.padding()
                Button{
                    let dateFormatter = DateFormatter()
                    dateFormatter.dateFormat = "dd/MM/YY"
                    transactionViewModel.addTransaction(avatar: "", name: transactionName, category: categoryName, date: dateFormatter.string(from: date), amount: Double(amount) ?? 0.0, recurring: isOn)
                    isPresented = false
                } label: {
                    Text("Submit").fontWeight(.bold).frame(maxWidth: .infinity)
                }.buttonStyle(.borderedProminent).tint(.black).padding(.bottom, 32).padding(.horizontal)
            }.textFieldStyle(.roundedBorder)
        }
    }
}

//#Preview {
//    AddTransactionSheet(transactionViewModel: )
//}

struct iOSCheckboxToggleStyle: ToggleStyle {
    func makeBody(configuration: Configuration) -> some View {
        Button(action: {
            configuration.isOn.toggle()
        }, label: {
            HStack {
                Image(systemName: configuration.isOn ? "checkmark.square" : "square").foregroundStyle(Color.black)
                configuration.label
            }
        })
    }
}
