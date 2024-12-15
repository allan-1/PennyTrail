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
    
    init(modelContext: ModelContext) {
        self.modelContext = modelContext
        fetchTransactions()
    }
    
    var totalAmount: Double {
        transactions.reduce(0) { $0 + $1.amount }
    }
    
    func fetchTransactions(){
        do{
            transactions = try modelContext.fetch(FetchDescriptor<TransactionModel>())
        }catch{
            print("Failed to catch transactions: \(error)")
        }
    }
    
    func addTransaction(avatar: String, name: String, category: String, date: String, amount: Double, recurring: Bool){
        let date = Date()
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "dd/MM/YY"
        
        let newTransaction = TransactionModel(id: UUID(), avatar: avatar, name: name, category: category, date:dateFormatter.string(from: date) , amount: amount, recurring: recurring)
        modelContext.insert(newTransaction)
        saveTransaction()
        fetchTransactions()
    }
    
    func updateTransaction(transaction: TransactionModel, newName: String, newAmount: Double, recurring: Bool){
        transaction.name = newName
        transaction.amount = newAmount
        transaction.recurring = recurring
        saveTransaction()
        fetchTransactions()
    }
    
    func deleteExpense(_ transaction: TransactionModel){
        modelContext.delete(transaction)
        saveTransaction()
        fetchTransactions()
    }
    
    private func saveTransaction(){
        do{
            try modelContext.save()
        }catch{
            print("Failed to save changes: \(error)")
        }
    }
}
