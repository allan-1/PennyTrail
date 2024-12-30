//
//  PotsComponents.swift
//  PennyTrail
//
//  Created by Allan on 12/12/24.
//

import SwiftUI

struct PotsComponents: View {
    let potItems: [PotsModel]
    var totalSaved: Double
    let columns: [GridItem] = [
        GridItem(.flexible()),
        GridItem(.flexible())
    ]
    var body: some View {
        VStack{
            CardHeaderComponents(titleText: "Pots", buttonText: "See Details", buttonAction: {}).padding()
            SavedComponets(amountSaved: "\(totalSaved)")
            LazyVGrid(columns: columns, spacing: 16){
                ForEach(potItems, id: \.id){
                    item in SavedItemComponent(itemName: item.name, itemAmount: item.saved, itemColor: item.theme.color).padding(.horizontal)
                }
            }.padding(.bottom)
        }.frame(maxWidth: .infinity)
            .background(Color.white)
            .cornerRadius(10)
            .shadow(radius: 0)
            .padding(.horizontal, 20)
    }
}

//#Preview {
//    PotsComponents()
//}
