//
//  TransactionItemComponent.swift
//  PennyTrail
//
//  Created by Allan on 12/12/24.
//

import SwiftUI

struct TransactionItemComponent: View {
    var body: some View {
        VStack{ 
            HStack{
                Image("userimg").resizable().frame(width: 40, height: 40).clipShape(/*@START_MENU_TOKEN@*/Circle()/*@END_MENU_TOKEN@*/).padding(.trailing)
                VStack(alignment: .leading){
                    Text("Allan Muturi").fontWeight(/*@START_MENU_TOKEN@*/.bold/*@END_MENU_TOKEN@*/)
                    Text("Bills").font(.footnote).foregroundStyle(Color(hex: 0x696868))
                }
            Spacer()
            VStack(alignment: .trailing){
                Text("+$75.00").fontWeight(/*@START_MENU_TOKEN@*/.bold/*@END_MENU_TOKEN@*/).padding(.bottom, 4)
                Text("19 Aug 2024").font(.footnote).foregroundStyle(Color(hex: 0x696868))
            }
        }
            Divider()
        }
    }
}

#Preview {
    TransactionItemComponent()
}
