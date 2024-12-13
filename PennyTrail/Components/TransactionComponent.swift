//
//  TransactionComponent.swift
//  PennyTrail
//
//  Created by Allan on 12/13/24.
//

import SwiftUI

struct TransactionComponent: View {
    let transList = [1,2,3,4,5]
    var body: some View {
        VStack{
            CardHeaderComponents(titleText: "Transaction", buttonText: "View All", buttonAction: {}).padding(.all)
            LazyVStack{
                ForEach(transList, id:\.self){
                    trans in TransactionItemComponent()
                }
            }.padding()
        }.frame(maxWidth: .infinity)
            .background(Color.white)
            .cornerRadius(10)
            .shadow(radius: 0)
            .padding(.horizontal, 20)
    }
}

#Preview {
    TransactionComponent()
}
