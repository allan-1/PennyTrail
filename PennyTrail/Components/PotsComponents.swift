//
//  PotsComponents.swift
//  PennyTrail
//
//  Created by Allan on 12/12/24.
//

import SwiftUI

struct PotsComponents: View {
    let items = ["Car", "Vacation", "MMF"]
    let columns: [GridItem] = [
        GridItem(.flexible()),
        GridItem(.flexible())
    ]
    var body: some View {
        VStack{
            CardHeaderComponents(titleText: "Pots", buttonText: "See Details", buttonAction: {}).padding()
            SavedComponets(amountSaved: "1,000")
            LazyVGrid(columns: columns, spacing: 16){
                ForEach(items, id: \.self){
                    item in SavedItemComponent().padding(.horizontal)
                }
            }.padding(.bottom)
        }.frame(maxWidth: .infinity)
            .background(Color.white)
            .cornerRadius(10)
            .shadow(radius: 0)
            .padding(.horizontal, 20)
    }
}

#Preview {
    PotsComponents()
}
