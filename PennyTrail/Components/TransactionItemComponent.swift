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
            Image(systemName: "person").resizable().frame(width: 35, height: 35).clipShape(/*@START_MENU_TOKEN@*/Circle()/*@END_MENU_TOKEN@*/)
            Text("Allan Muturi").fontWeight(/*@START_MENU_TOKEN@*/.bold/*@END_MENU_TOKEN@*/)
            Spacer()
            VStack(alignment: .trailing){
                Text("+$75.00").fontWeight(/*@START_MENU_TOKEN@*/.bold/*@END_MENU_TOKEN@*/).padding(.bottom, 4)
                Text("19 Aug 2024").font(.footnote)
            }
        }
            Divider()
        }
    }
}

#Preview {
    TransactionItemComponent()
}
