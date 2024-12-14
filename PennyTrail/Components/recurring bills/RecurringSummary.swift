//
//  RecurringSummary.swift
//  PennyTrail
//
//  Created by Allan on 12/14/24.
//

import SwiftUI

struct RecurringSummary: View {
    var body: some View {
        VStack(alignment: .leading){
            Text("Summary").fontWeight(/*@START_MENU_TOKEN@*/.bold/*@END_MENU_TOKEN@*/).font(.title3).padding()
            BillComponent()
            BillComponent()
            BillComponent()
        }.frame(maxWidth: .infinity)
            .background(Color.white)
            .cornerRadius(10)
            .shadow(radius: 0)
            .padding(.horizontal, 20)
    }
}

#Preview {
    RecurringSummary()
}
