//
//  PotsModel.swift
//  PennyTrail
//
//  Created by Allan on 12/14/24.
//

import Foundation
import SwiftData

@Model
class PotsModel{
    var id: UUID
    var name: String
    var saved: Double
    var target: Double
    @Relationship var theme: ThemeModel
    
    init(id: UUID, name: String, saved: Double, target: Double, theme: ThemeModel) {
        self.id = id
        self.name = name
        self.saved = saved
        self.target = target
        self.theme = theme
    }
}
