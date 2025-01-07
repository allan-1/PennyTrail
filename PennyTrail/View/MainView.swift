//
//  MainView.swift
//  PennyTrail
//
//  Created by Allan on 12/13/24.
//

import SwiftUI
import SwiftData

enum Tab{
    case HomeView
    case TransactionView
    case BudgetView
    case PotsView
    case ReccuringView
}

struct MainView: View {
    @Environment(\.modelContext) private var modelContext
    @State var selection: Tab = .HomeView
    var body: some View {
        TabView(selection: $selection){
            NavigationStack{
                HomeView(modelContext: modelContext, tab: $selection)
            }.tabItem {
                Image(systemName: "house")
            }.tag(Tab.HomeView)
            
            NavigationStack{
                TransactionView(modelContext: modelContext)
            }.tabItem {
                Label("", systemImage: "arrow.up.arrow.down")
            }.tag(Tab.TransactionView)
            
            NavigationStack{
                BudgetView(modelContext: modelContext, tab: $selection)
            }.tabItem {
                Label("", systemImage: "chart.pie.fill")
            }.tag(Tab.BudgetView)
            
            NavigationStack{
                PotsView(modelContext: modelContext)
            }.tabItem {
                Label("", systemImage: "bag.fill")
            }.tag(Tab.PotsView)
            
            NavigationStack{
                RecurringBillView()
            }.tabItem { Label("", systemImage: "line.3.horizontal.button.angledtop.vertical.right.fill") }.tag(Tab.ReccuringView)
        }
    }
}

#Preview {
    MainView()
}
