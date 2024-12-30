//
//  BudgetView.swift
//  PennyTrail
//
//  Created by Allan on 12/13/24.
//

import SwiftUI
import SwiftData

struct BudgetView: View {
    @StateObject private var budgetViewModel: BudgetsViewModel
    
    @State private var isShowingSheet = false
    
    init(modelContext: ModelContext){
        _budgetViewModel = StateObject(wrappedValue: BudgetsViewModel(modelContext: modelContext))
    }
    var body: some View {
        NavigationStack{
            ZStack{
                Color(hex:0xF8F4F0)
                ScrollView{
                    BudgetSummary(spent: budgetViewModel.totalSpent, max: budgetViewModel.totalMax, spentValues: budgetViewModel.spentValues, budgets: budgetViewModel.budgets).padding(.bottom)
                    LazyVStack{
                        ForEach(budgetViewModel.budgets, id: \.id){budget in
                            BudgetItemDescription(budgetItem: budget)
                        }
                    }
                }
            }.background(Color(hex:0xF8F4F0)).navigationTitle("Budgets").toolbar{
                ToolbarItem(placement: .topBarTrailing){
                    Button{
                        isShowingSheet = true
                        print("Clicked")
                    }label: {
                        Image(systemName: "plus.circle.fill").font(.title2)
                    }.tint(.black)
                }
            }.sheet(isPresented: $isShowingSheet) {
                    AddBudgetSheet(isPresented: $isShowingSheet, budgetViewModel: budgetViewModel)
                    }
        }
        }
    }


//#Preview {
//    BudgetView()
//}
