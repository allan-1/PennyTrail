//
//  SavedItemComponent.swift
//  PennyTrail
//
//  Created by Allan on 12/12/24.
//

import SwiftUI

struct SavedItemComponent: View {
    var itemName: String
    var itemAmount: Double
    var itemColor: Int
    var body: some View {
        HStack{
            Rectangle().fill(Color(hex: itemColor)).frame(width: 5, height: 50).clipShape(RoundedRectangle(cornerRadius: 10))
            VStack(alignment: .leading){
                Text(itemName).foregroundStyle(Color(hex: 0x696868)).padding(.bottom, 2)
                Text("$ \(itemAmount, specifier: "%.2f")").fontWeight(/*@START_MENU_TOKEN@*/.bold/*@END_MENU_TOKEN@*/)
            }
        }.frame(maxWidth: .infinity, alignment: .leading)
    }
}

//#Preview {
//    SavedItemComponent()
//}
