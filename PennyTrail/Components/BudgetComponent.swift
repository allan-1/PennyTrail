//
//  BudgetComponent.swift
//  PennyTrail
//
//  Created by Allan on 12/13/24.
//

import SwiftUI

struct BudgetComponent: View {
    let budgetItems: [BudgetModel]
    var spent: Double
    var totalMax: Double
    let columns: [GridItem] = [
        GridItem(.flexible()),
        GridItem(.flexible())
    ]
    var buttonAction: () -> Void
    
    var body: some View {
        VStack{
            CardHeaderComponents(titleText: "Budgets", buttonText: "See Details", buttonAction: buttonAction).padding()
            DonutChart(spent: spent, totalMax: totalMax, chartData: budgetItems.map{$0.spent}, colorThemes: budgetItems.map{$0.theme.color})
            LazyVGrid(columns: columns, spacing: 16){
                ForEach(budgetItems, id: \.self){
                    item in SavedItemComponent(itemName: item.category, itemAmount: item.spent, itemColor: item.theme.color).padding(.horizontal)
                }
            }.padding()
        }.frame(maxWidth: .infinity)
            .background(Color.white)
            .cornerRadius(10)
            .shadow(radius: 0)
            .padding(.horizontal, 20)
    }
}

//#Preview {
//    BudgetComponent()
//}
