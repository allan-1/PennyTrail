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
    @Binding var tab: Tab
    @State private var isShowingSheet = false
    
    init(modelContext: ModelContext, tab: Binding<Tab>){
        _budgetViewModel = StateObject(wrappedValue: BudgetsViewModel(modelContext: modelContext))
        _tab = tab
    }
    var body: some View {
        NavigationStack{
            ZStack{
                Color(hex:0xF8F4F0)
                ScrollView{
                    BudgetSummary(spent: budgetViewModel.totalSpent, max: budgetViewModel.totalMax, spentValues: budgetViewModel.spentValues, budgets: budgetViewModel.budgets).padding(.bottom)
                    LazyVStack{
                        ForEach(budgetViewModel.budgets, id: \.id){budget in
                            let budgetTransaction = budgetViewModel.fetchBudgetTransaction(by: budget.category)
                            BudgetItemDescription(budgetItem: budget, budgetTransactions: budgetTransaction, buttonAction: {self.tab = .TransactionView})
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
