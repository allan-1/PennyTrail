//
//  BudgetItemComponent.swift
//  PennyTrail
//
//  Created by Allan on 12/13/24.
//

import SwiftUI

struct BudgetItemComponent: View {
    var body: some View {
        HStack{
            Rectangle().fill(Color(hex: 0x696868)).frame(width: 5, height: 50).clipShape(RoundedRectangle(cornerRadius: 10)).padding(.trailing, 4)
            VStack{
                Text("Car").foregroundStyle(Color(hex: 0x696868)).padding(.bottom, 2)
            }
        }.frame(maxWidth: .infinity, alignment: .leading)
    }
}

#Preview {
    BudgetItemComponent()
}
