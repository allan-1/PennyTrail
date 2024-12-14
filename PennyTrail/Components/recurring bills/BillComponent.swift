//
//  BillComponent.swift
//  PennyTrail
//
//  Created by Allan on 12/14/24.
//

import SwiftUI

struct BillComponent: View {
    var body: some View {
        VStack{
            HStack{
            Text("Paid Bills").foregroundStyle(Color(hex: 0x696868))
            Spacer()
            Text("4($194.98)").fontWeight(/*@START_MENU_TOKEN@*/.bold/*@END_MENU_TOKEN@*/)
        }
            Divider()
        }.padding(.bottom).padding(.horizontal)
    }
}

#Preview {
    BillComponent()
}
