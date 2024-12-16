//
//  PennyTrailApp.swift
//  PennyTrail
//
//  Created by Allan on 12/4/24.
//

import SwiftUI
import SwiftData

@main
struct PennyTrailApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView().modelContainer(for: [TransactionModel.self, PotsModel.self, BudgetModel.self])
        }
    }
}
