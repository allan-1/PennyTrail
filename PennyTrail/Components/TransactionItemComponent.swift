//
//  TransactionItemComponent.swift
//  PennyTrail
//
//  Created by Allan on 12/12/24.
//

import SwiftUI

struct TransactionItemComponent: View {
    let transactionName: String
    let transactionCategory: String
    let transactionAmount: String
    let transactionDate: String
    
    var initials: String {
           let components = transactionName.split(separator: " ")
           let firstInitial = components.first?.prefix(1) ?? ""
           let lastInitial = components.dropFirst().first?.prefix(1) ?? ""
           return "\(firstInitial)\(lastInitial)".uppercased()
       }
    
    var body: some View {
        VStack{
            HStack{
                Text(initials)
                    .font(.headline)
                    .foregroundColor(.white)
                    .frame(width: 50, height: 50)
                    .background(Circle().fill(Color.purple))
                    .overlay(
                        Circle()
                            .stroke(Color.white, lineWidth: 2)
                    )
                VStack(alignment: .leading){
                    Text(transactionName).font(.subheadline).fontWeight(/*@START_MENU_TOKEN@*/.bold/*@END_MENU_TOKEN@*/)
                    Text(transactionCategory).font(.footnote).foregroundStyle(Color(hex: 0x696868))
                }
                Spacer()
                VStack(alignment: .trailing){
                    Text("+$\(transactionAmount)").font(.subheadline).fontWeight(/*@START_MENU_TOKEN@*/.bold/*@END_MENU_TOKEN@*/).padding(.bottom, 4).foregroundStyle(Double(transactionAmount) ?? 0.0 > 0 ? Color(hex: 0x277C78) : Color.red)
                    Text(transactionDate).font(.footnote).foregroundStyle(Color(hex: 0x696868))
                }
            }
            Divider()
        }
    }
}

#Preview {
    TransactionItemComponent(transactionName: "Allan Maina", transactionCategory: "Test", transactionAmount: "230.00", transactionDate: "1/2/3")
}
