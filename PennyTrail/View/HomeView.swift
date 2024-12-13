//
//  HomeView.swift
//  PennyTrail
//
//  Created by Allan on 12/6/24.
//

import SwiftUI

struct HomeView: View {
    var body: some View {
        ZStack{
            Color(hex:0xF8F4F0)
            ScrollView{
                VStack{
                    SummaryCardComponent(cardTitle: "Current Balance", cardAmount: "0.00", cardColor: 0x000000, cardTitleColor: 0xFFFFFF, CardAmountColor: 0xFFFFFF)
                    SummaryCardComponent(cardTitle: "Income", cardAmount: "0.00")
                    SummaryCardComponent(cardTitle: "Expenses", cardAmount: "0.00")
                    PotsComponents()
                    TransactionComponent()
                    BudgetComponent()
                    RecurringComponent()
                }
            }
        }.background(Color(hex: 0xF8F4F0))
    }
}

#Preview {
    HomeView()
}
