//
//  RecurringComponent.swift
//  PennyTrail
//
//  Created by Allan on 12/13/24.
//

import SwiftUI

struct RecurringComponent: View {
    var body: some View {
        VStack{
            CardHeaderComponents(titleText: "Recurring Bills", buttonText: "See Details", buttonAction: {}).padding()
            RecurringItemComponent(colorHex: 0x277C78, itemTitle: "Paid Bills")
            RecurringItemComponent(colorHex: 0xF2CDAC, itemTitle: "Total Upcoming")
            RecurringItemComponent(colorHex: 0x82C9D7, itemTitle: "Due Soon").padding(.bottom)
        }.frame(maxWidth: .infinity)
            .background(Color.white)
            .cornerRadius(10)
            .shadow(radius: 0)
            .padding(.horizontal, 20)
    }
}

#Preview {
    RecurringComponent()
}
