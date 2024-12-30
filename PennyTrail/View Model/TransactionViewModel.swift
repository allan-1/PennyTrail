//
//  TransactionViewModel.swift
//  PennyTrail
//
//  Created by Allan on 12/14/24.
//

import Foundation
import SwiftData

class TransactionViewModel: ObservableObject{
    @Published var transactions: [TransactionModel] = []
    let modelContext: ModelContext
    private var budgets: [BudgetModel] = []
    
    init(modelContext: ModelContext) {
        self.modelContext = modelContext
        fetchTransactions()
        fetchBudgets()
    }
    
    var totalTransactionAmount: Double {
        transactions.reduce(0) { $0 + $1.amount }
    }
    
    func fetchTransactions(){
        do{
            transactions = try modelContext.fetch(FetchDescriptor<TransactionModel>())
        }catch{
            print("Failed to catch transactions: \(error)")
        }
    }
    
    private func fetchBudgets() {
        do {
            budgets = try modelContext.fetch(FetchDescriptor<BudgetModel>())
        } catch {
            print("Failed to fetch budgets: \(error)")
        }
    }
    
    func addTransaction(avatar: String, name: String, category: String, date: String, amount: Double, recurring: Bool){
        let date = Date()
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "dd/MM/YY"
        
        let newTransaction = TransactionModel(avatar: avatar, name: name, category: category, date:dateFormatter.string(from: date) , amount: amount, recurring: recurring)
        modelContext.insert(newTransaction)
        updateBudgetSpent(for: category, by: amount)
        saveTransaction()
        fetchTransactions()
    }
    
    func updateTransaction(transaction: TransactionModel, newName: String, newAmount: Double, recurring: Bool){
        transaction.name = newName
        transaction.amount = newAmount
        transaction.recurring = recurring
        updateBudgetSpent(for: transaction.category, by: newAmount - transaction.amount)
        saveTransaction()
        fetchTransactions()
    }
    
    func deleteExpense(_ transaction: TransactionModel){
        modelContext.delete(transaction)
        updateBudgetSpent(for: transaction.category, by: -transaction.amount)
        saveTransaction()
        fetchTransactions()
    }
    
    private func updateBudgetSpent(for category: String, by amount: Double) {
        print(budgets)
        guard let budget = budgets.first(where: { $0.category == category }) else {
            print("No budget found for category: \(category)")
            return
        }
        budget.spent += amount
    }
    
    private func saveTransaction(){
        do{
            try modelContext.save()
        }catch{
            print("Failed to save changes: \(error)")
        }
    }
}
