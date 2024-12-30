//
//  BudgetSummaryItem.swift
//  PennyTrail
//
//  Created by Allan on 12/13/24.
//

import SwiftUI

struct BudgetSummaryItem: View {
    var spent: Double
    var limit: Double
    var itemName: String
    var itemTheme: ThemeModel
    var body: some View {
        HStack{
            BudgetItemComponent(itemName: itemName, itemTheme: itemTheme)
            Text("\(spent, specifier: "%.2f")").fontWeight(/*@START_MENU_TOKEN@*/.bold/*@END_MENU_TOKEN@*/)
            Text("of \(limit, specifier: "%.2f")").foregroundStyle(Color(hex: 0x696868)).padding(.trailing)
        }
    }
}

//#Preview {
//    BudgetSummaryItem()
//}
