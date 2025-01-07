//
//  HomeView.swift
//  PennyTrail
//
//  Created by Allan on 12/6/24.
//

import SwiftUI
import SwiftData

struct HomeView: View {
    @StateObject private var transactionViewModel: TransactionViewModel
    @StateObject private var potsViewModel: PotsViewModel
    @StateObject private var budgetViewModel: BudgetsViewModel
    
    @Binding var tab: Tab
    
    init(modelContext: ModelContext, tab: Binding<Tab>){
        _transactionViewModel = StateObject(wrappedValue: TransactionViewModel(modelContext: modelContext))
        _potsViewModel = StateObject(wrappedValue: PotsViewModel(modelContext: modelContext))
        _budgetViewModel = StateObject(wrappedValue: BudgetsViewModel(modelContext: modelContext))
        _tab = tab
    }
    var body: some View {
        NavigationStack{
            ZStack{
                Color(hex:0xF8F4F0)
                ScrollView{
                    VStack{
                        SummaryCardComponent(cardTitle: "Current Balance", cardAmount: "\(transactionViewModel.totalTransactionAmount)", cardColor: 0x000000, cardTitleColor: 0xFFFFFF, CardAmountColor: 0xFFFFFF)
                        SummaryCardComponent(cardTitle: "Income", cardAmount: "\(transactionViewModel.totalTransactionAmount)")
                        SummaryCardComponent(cardTitle: "Expenses", cardAmount: "0.00")
                        PotsComponents(potItems: potsViewModel.pots, totalSaved: potsViewModel.totalSaved, buttonAction: {self.tab = .PotsView})
                        TransactionComponent(transList: transactionViewModel.transactions, buttonAction: {self.tab = .TransactionView})
                        BudgetComponent(budgetItems: budgetViewModel.budgets, spent: budgetViewModel.totalMax, totalMax: budgetViewModel.totalSpent, buttonAction: {self.tab = .BudgetView})
                        RecurringComponent(buttonAction: {self.tab = .ReccuringView})
                    }
                }
            }.background(Color(hex: 0xF8F4F0)).navigationTitle("Overview")
        }.onAppear{
            transactionViewModel.fetchTransactions()
            budgetViewModel.fetchBudgets()
            potsViewModel.fetchPots()
        }
    }
}

//#Preview {
//    HomeView(modelContext: <#ModelContext#>)
//}
