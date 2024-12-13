//
//  RecuuringItemComponent.swift
//  PennyTrail
//
//  Created by Allan on 12/13/24.
//

import SwiftUI

struct RecurringItemComponent: View {
    var colorHex: Int
    var itemTitle: String
    var body: some View {
        HStack{
            HStack{
                Text(itemTitle).foregroundStyle(Color(hex: 0x696868)).padding()
                Spacer()
                Text("$ 0.00").fontWeight(/*@START_MENU_TOKEN@*/.bold/*@END_MENU_TOKEN@*/).padding()
            }.frame(maxWidth: .infinity)
                .background(Color(hex: 0xF8F4F0))
                .cornerRadius(8)
                .shadow(radius: 0)
                .padding(.leading, 4).padding(.trailing, 0)
        }.frame(maxWidth: .infinity)
            .background(Color(hex: colorHex))
            .cornerRadius(10)
            .shadow(radius: 0)
            .padding(.leading, 20).padding(.trailing)
    }
}

#Preview {
    RecurringItemComponent(colorHex: 0x277C78, itemTitle: "Paid Bills")
}
