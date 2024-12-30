//
//  BudgetSummary.swift
//  PennyTrail
//
//  Created by Allan on 12/13/24.
//

import SwiftUI

struct BudgetSummary: View {
    var spent: Double
    var max: Double
    var spentValues: [Double]
    var budgets: [BudgetModel]
    var body: some View {
        VStack{
            DonutChart(spent: spent, totalMax: max, chartData: spentValues, colorThemes: budgets.map{$0.theme.color}).padding()
            VStack(alignment: .leading){
                Text("Spending Summary").font(/*@START_MENU_TOKEN@*/.title/*@END_MENU_TOKEN@*/).fontWeight(/*@START_MENU_TOKEN@*/.bold/*@END_MENU_TOKEN@*/)
                LazyVStack(spacing: 16){
                    ForEach(budgets, id: \.id){
                        item in BudgetSummaryItem(spent: item.spent, limit: item.max, itemName: item.category, itemTheme: item.theme)
                    }
                }.padding()
            }.padding()
        }.frame(maxWidth: .infinity)
            .background(Color.white)
            .cornerRadius(10)
            .shadow(radius: 0)
            .padding(.horizontal, 20)
    }
}

//#Preview {
//    BudgetSummary()
//}
