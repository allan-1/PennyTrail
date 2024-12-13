//
//  SavedItemComponent.swift
//  PennyTrail
//
//  Created by Allan on 12/12/24.
//

import SwiftUI

struct SavedItemComponent: View {
    var body: some View {
        HStack{
            Rectangle().fill(Color(hex: 0x696868)).frame(width: 5, height: 50).clipShape(RoundedRectangle(cornerRadius: 10)).padding(.trailing, 4)
            VStack{
                Text("Car").foregroundStyle(Color(hex: 0x696868)).padding(.bottom, 2)
                Text("$ 0").fontWeight(/*@START_MENU_TOKEN@*/.bold/*@END_MENU_TOKEN@*/)
            }
        }.frame(maxWidth: .infinity, alignment: .leading)
    }
}

#Preview {
    SavedItemComponent()
}
