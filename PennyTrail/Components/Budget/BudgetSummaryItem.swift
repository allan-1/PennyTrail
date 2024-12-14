//
//  BudgetSummaryItem.swift
//  PennyTrail
//
//  Created by Allan on 12/13/24.
//

import SwiftUI

struct BudgetSummaryItem: View {
    var body: some View {
        HStack{
            BudgetItemComponent()
            Text("$25.00").fontWeight(/*@START_MENU_TOKEN@*/.bold/*@END_MENU_TOKEN@*/)
            Text("of 4000.00").foregroundStyle(Color(hex: 0x696868)).padding(.trailing)
        }
    }
}

#Preview {
    BudgetSummaryItem()
}
