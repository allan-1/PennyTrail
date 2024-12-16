//
//  TransactionComponent.swift
//  PennyTrail
//
//  Created by Allan on 12/13/24.
//

import SwiftUI

struct TransactionComponent: View {
    var titleText: String = "Transaction"
    var buttonText: String = "View All"
    var backcolor: Int = 0xFFFFFF
    let transList: [TransactionModel]
    var body: some View {
        VStack{
            CardHeaderComponents(titleText: titleText, buttonText: buttonText, buttonAction: {}).padding(.all)
            LazyVStack{
                ForEach(transList, id:\.id){
                    trans in TransactionItemComponent(transactionName: trans.name, transactionCategory: trans.category, transactionAmount: "\(trans.amount)", transactionDate: trans.date)
                }
            }.padding()
        }.frame(maxWidth: .infinity)
            .background(Color(hex: backcolor))
            .cornerRadius(10)
            .shadow(radius: 0)
            .padding(.horizontal, 20)
    }
}

//#Preview {
//    TransactionComponent()
//}
