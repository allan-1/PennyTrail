//
//  BudgetsViewModel.swift
//  PennyTrail
//
//  Created by Allan on 12/15/24.
//

import Foundation
import SwiftData

class BudgetsViewModel: ObservableObject{
    @Published var budgets: [BudgetModel] = []
    var modelContext: ModelContext
    
    init(modelContext: ModelContext) {
        self.modelContext = modelContext
        fetchBudgets()
    }
    
    var totalSpent: Double{
        budgets.reduce(0){$0 + $1.spent}
    }
    
    var totalMax: Double{
        budgets.reduce(0){$0 + $1.max}
    }
    
    var spentValues: [Double]{
        budgets.map { $0.spent }
    }
    
    var themeColors: [Int]{
        budgets.map{$0.theme.color}
    }
    
    func fetchBudgets(){
        do{
           budgets = try modelContext.fetch(FetchDescriptor<BudgetModel>())
        }catch{
            print("failed to fetch budget: \(error)")
        }
    }
    
    func addBudget(category: String, spent: Double, max: Double, theme: ThemeModel){
        let newBudget = BudgetModel(category: category, spent: spent, max: max, theme: theme)
        modelContext.insert(newBudget)
        saveBudget()
        fetchBudgets()
    }
    
    func updateBudget(budget: BudgetModel, spent: Double, max: Double){
        budget.spent = spent
        budget.max = max
        saveBudget()
        fetchBudgets()
    }
    
    func deleteBudget(_ budget: BudgetModel){
        modelContext.delete(budget)
        saveBudget()
        fetchBudgets()
    }
    
    private func saveBudget(){
        do{
            try modelContext.save()
        }catch{
            print("Failed to save: \(error)")
        }
    }
}
