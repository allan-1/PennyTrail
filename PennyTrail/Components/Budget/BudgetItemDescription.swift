//
//  BudgetItemDescription.swift
//  PennyTrail
//
//  Created by Allan on 12/13/24.
//

import SwiftUI

struct BudgetItemDescription: View {
    var budgetItem: BudgetModel
    var budgetTransactions: [TransactionModel]
    var buttonAction: () -> Void
    var body: some View {
        VStack(alignment: .leading){
            HStack{
                Rectangle().frame(width: 20, height: 20).clipShape(/*@START_MENU_TOKEN@*/Circle()/*@END_MENU_TOKEN@*/).foregroundStyle(Color(hex: budgetItem.theme.color))
                Text("\(budgetItem.category)").fontWeight(/*@START_MENU_TOKEN@*/.bold/*@END_MENU_TOKEN@*/).font(/*@START_MENU_TOKEN@*/.title/*@END_MENU_TOKEN@*/)
                Spacer()
                Button{
                    
                }label: {
                    Image(systemName: "ellipsis").foregroundStyle(Color(.black))
                }
            }.padding()
            Text("Maximum of \(budgetItem.max,  specifier: "%.2f")").font(.callout).foregroundStyle(Color(hex: 0x696868)).padding(.horizontal)
            ProgressView(value: budgetItem.spent / budgetItem.max).progressViewStyle(CustomProgressBar(themeColor: budgetItem.theme.color))
            HStack{
                SavedItemComponent(itemName: "Spent", itemAmount: budgetItem.spent, itemColor: budgetItem.theme.color)
                SavedItemComponent(itemName: "Remainig", itemAmount: budgetItem.max - budgetItem.spent, itemColor: 0xF8F4F0)
            }.padding()
            TransactionComponent(titleText: "Latest Spending", buttonText: "View All", backcolor: 0xF8F4F0, transList: budgetTransactions, buttonAction: buttonAction).padding(.bottom)
        }.frame(maxWidth: .infinity)
            .background(Color.white)
            .cornerRadius(10)
            .shadow(radius: 0)
            .padding(.horizontal, 20)
    }
}

struct CustomProgressBar: ProgressViewStyle {
    var themeColor: Int
    func makeBody(configuration: Configuration) -> some View {
        ZStack(alignment: .leading) {
            Rectangle()
                .frame(maxWidth: .infinity, maxHeight: 30)
                .foregroundStyle(Color(hex: 0xF8F4F0))
                .cornerRadius(4)
            Rectangle()
                .frame(
                    width: (300 * CGFloat(configuration.fractionCompleted ?? 0.0)).clamped(to: 0...300),
                    height: 25
                )
                .cornerRadius(4)
                .padding(.horizontal, 4)
                .foregroundStyle(Color(hex: themeColor))
        }
        .cornerRadius(4)
        .padding(.horizontal)
    }
}

//#Preview {
//    BudgetItemDescription()
//}
