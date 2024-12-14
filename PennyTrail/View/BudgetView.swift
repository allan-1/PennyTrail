//
//  BudgetView.swift
//  PennyTrail
//
//  Created by Allan on 12/13/24.
//

import SwiftUI

struct BudgetView: View {
    var body: some View {
        NavigationStack{
            ZStack{
                Color(hex:0xF8F4F0)
                ScrollView{
                    BudgetSummary().padding(.bottom)
                    BudgetItemDescription()
                }
            }.background(Color(hex:0xF8F4F0)).navigationTitle("Budgets").toolbar{
                ToolbarItem(placement: .topBarTrailing){
                    Button{
                        
                    }label: {
                        Image(systemName: "plus.circle.fill").font(.title2)
                    }.tint(.black)
                }
            }
        }
    }
}

#Preview {
    BudgetView()
}
