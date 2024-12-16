//
//  MainView.swift
//  PennyTrail
//
//  Created by Allan on 12/13/24.
//

import SwiftUI
import SwiftData

struct MainView: View {
    @Environment(\.modelContext) private var modelContext
    var body: some View {
        TabView{
            HomeView(modelContext: modelContext).tabItem {
                Image(systemName: "house")
            }
            TransactionView(modelContext: modelContext).tabItem {
                Label("", systemImage: "arrow.up.arrow.down")
            }
            BudgetView().tabItem {
                Label("", systemImage: "chart.pie.fill")
            }
            PotsView().tabItem {
                Label("", systemImage: "bag.fill")
            }
            RecurringBillView().tabItem { Label("", systemImage: "line.3.horizontal.button.angledtop.vertical.right.fill") }
        }
    }
}

#Preview {
    MainView()
}
