//
//  BudgetModel.swift
//  PennyTrail
//
//  Created by Allan on 12/14/24.
//

import Foundation
import SwiftData

@Model
class BudgetModel{
    var id: UUID
    var category: String
    var spent: Double
    var max: Double
    @Relationship var theme: ThemeModel
    
    init(id: UUID = UUID(), category: String, spent: Double, max: Double, theme: ThemeModel) {
        self.id = id
        self.category = category
        self.spent = spent
        self.max = max
        self.theme = theme
    }
}
