//
//  ThemeModel.swift
//  PennyTrail
//
//  Created by Allan on 12/14/24.
//

import Foundation
import SwiftData

@Model
class ThemeModel{
    var id: UUID
    var name: String
    var color: Int
    var isUsed: Bool
    
    init(id: UUID = UUID(), name: String, color: Int, isUsed: Bool = false) {
        self.id = id
        self.name = name
        self.color = color
        self.isUsed = isUsed
    }
}
