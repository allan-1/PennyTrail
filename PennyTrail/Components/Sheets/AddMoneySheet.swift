//
//  AddMoneySheet.swift
//  PennyTrail
//
//  Created by Allan on 12/30/24.
//

import SwiftUI

struct AddMoneySheet: View {
    @State private var amount: String = ""
    var potsViewModel: PotsViewModel
    var isWithdraw: Bool
    var potItem: PotsModel
    @Binding var isPresented: Bool
    var body: some View {
        let progress = max(0.0, min(1.0, (Double(amount) ?? 0.0) / potItem.target))
        ScrollView{
            VStack(alignment: .leading){
                isWithdraw ? Text("Withdraw from '\(potItem.name)'").font(.title).fontWeight(.bold).padding() :Text("Add to '\(potItem.name)'").font(.title).fontWeight(.bold).padding()
                isWithdraw ?
                Text("Withdraw from your pot to put money back in your main balance. This will reduce the amount you have in this pot. ").padding().foregroundStyle(Color(hex: 0x696868)) : Text("Add money to your pot to keep it separate from your main balance. As soon as you add this money, it will be deducted from your current balance. ").padding().foregroundStyle(Color(hex: 0x696868))
                HStack{
                    Text("New Amount").foregroundStyle(Color(hex: 0x696868))
                    Spacer()
                    Text("$\(Double(amount) ?? 0.0, specifier: "%.2f")").fontWeight(.bold).font(/*@START_MENU_TOKEN@*/.title/*@END_MENU_TOKEN@*/)
                }.padding(.horizontal)
                ProgressView(value: progress).progressViewStyle(CustomProgressBarStyle(themeColor: potItem.theme.color))
                HStack{
                    Text("\(((Double(amount) ?? 0.0) / potItem.target) * 100, specifier: "%.2f")%").foregroundStyle(Color(hex: 0x696868)).fontWeight(/*@START_MENU_TOKEN@*/.bold/*@END_MENU_TOKEN@*/)
                    Spacer()
                    Text("Target of $\(potItem.target, specifier: "%.2f")").foregroundStyle(Color(hex: 0x696868))
                }.padding(.horizontal).padding(.bottom, 32)
                isWithdraw ? Text("Amount to Withdraw").padding(.horizontal).foregroundStyle(Color(hex: 0x696868)) : Text("Amount to Add").padding(.horizontal).foregroundStyle(Color(hex: 0x696868))
                TextField("e.g 1000", text: $amount).keyboardType(.decimalPad).autocorrectionDisabled().padding(.bottom).padding(.horizontal)
                Button{
                    potsViewModel.addMoney(saved: (isWithdraw ? -(Double(amount) ?? 0.0) : Double(amount)) ?? 0.0, pot: potItem)
                    isPresented = false
                } label: {
                    isWithdraw ? Text("Confirm Withdrawal").fontWeight(.bold).frame(maxWidth: .infinity) : Text("Confirm Addition").fontWeight(.bold).frame(maxWidth: .infinity)
                }.buttonStyle(.borderedProminent).tint(.black).padding(.bottom, 32).padding(.horizontal).padding(.top)
            }.textFieldStyle(.roundedBorder)
        }
    }
}

//#Preview {
//    AddMoneySheet()
//}
