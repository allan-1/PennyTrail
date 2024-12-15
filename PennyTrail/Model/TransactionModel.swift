//
//  TransactionModel.swift
//  PennyTrail
//
//  Created by Allan on 12/14/24.
//

import Foundation
import SwiftData

@Model
class TransactionModel{
    var id: UUID
    var avatar: String
    var name: String
    var category: String
    var date: String
    var amount: Double
    var recurring: Bool
    
    init(id: UUID, avatar: String, name: String, category: String, date: String, amount: Double, recurring: Bool) {
        self.id = id
        self.avatar = avatar
        self.name = name
        self.category = category
        self.date = date
        self.amount = amount
        self.recurring = recurring
    }
}
