//
//  BudgetSummary.swift
//  PennyTrail
//
//  Created by Allan on 12/13/24.
//

import SwiftUI

struct BudgetSummary: View {
    var body: some View {
        VStack{
            DonutChart(spent: 0.0, totalMax: 0.0).padding()
            VStack(alignment: .leading){
                Text("Spending Summary").font(/*@START_MENU_TOKEN@*/.title/*@END_MENU_TOKEN@*/).fontWeight(/*@START_MENU_TOKEN@*/.bold/*@END_MENU_TOKEN@*/)
                BudgetSummaryItem()
                BudgetSummaryItem()
                BudgetSummaryItem()
            }.padding()
        }.frame(maxWidth: .infinity)
            .background(Color.white)
            .cornerRadius(10)
            .shadow(radius: 0)
            .padding(.horizontal, 20)
    }
}

#Preview {
    BudgetSummary()
}
