//
//  BudgetItemComponent.swift
//  PennyTrail
//
//  Created by Allan on 12/13/24.
//

import SwiftUI

struct BudgetItemComponent: View {
    var itemName: String
    var itemTheme: ThemeModel
    var body: some View {
        HStack{
            Rectangle().fill(Color(hex: itemTheme.color)).frame(width: 4, height: 35).clipShape(RoundedRectangle(cornerRadius: 10)).padding(.trailing, 4)
            VStack{
                Text(itemName).foregroundStyle(Color(hex: 0x696868)).padding(.bottom, 2)
            }
        }.frame(maxWidth: .infinity, alignment: .leading)
    }
}

//#Preview {
//    BudgetItemComponent()
//}
