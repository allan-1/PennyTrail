//
//  SummaryCardComponent.swift
//  PennyTrail
//
//  Created by Allan on 12/6/24.
//

import SwiftUI

struct SummaryCardComponent: View {
    var cardTitle: String
    var cardAmount: String
    var cardColor: Int = 0xFFFFFF
    var cardTitleColor: Int = 0x696868
    var CardAmountColor: Int = 0x201F24
    var body: some View {
        VStack(alignment: .leading){
            Text(cardTitle).foregroundStyle(Color(hex: cardTitleColor)).padding(.horizontal).padding(.top).padding(.bottom, 8)
            Text("$\(cardAmount)").fontWeight(.bold).font(/*@START_MENU_TOKEN@*/.title/*@END_MENU_TOKEN@*/).foregroundStyle(Color(hex: CardAmountColor)).padding(.horizontal).padding(.bottom, 20)
        }.frame(maxWidth: .infinity, alignment: .leading).background(Color(hex: cardColor)).clipShape(RoundedRectangle(cornerRadius: 10)).shadow(radius: 0)
            .padding(.horizontal, 20)
    }
}

#Preview {
    SummaryCardComponent(cardTitle: "Current Balance", cardAmount: "3,814.25",cardColor: 0x000000, cardTitleColor: 0xFFFFFF, CardAmountColor: 0xFFFFFF)
}
