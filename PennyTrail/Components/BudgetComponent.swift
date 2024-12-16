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
    var body: some View {
        VStack{
            CardHeaderComponents(titleText: "Budgets", buttonText: "See Details", buttonAction: {}).padding()
            DonutChart(spent: spent, totalMax: totalMax)
            LazyVGrid(columns: columns, spacing: 16){
                ForEach(budgetItems, id: \.self){
                    item in SavedItemComponent().padding(.horizontal)
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
