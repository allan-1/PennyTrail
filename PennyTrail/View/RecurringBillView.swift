//
//  RecurringBillView.swift
//  PennyTrail
//
//  Created by Allan on 12/13/24.
//

import SwiftUI

struct RecurringBillView: View {
    var body: some View {
        NavigationStack{
            ZStack{
                Color(hex:0xF8F4F0)
                ScrollView{
                    VStack{
                        TotalBillsComponent().padding(.bottom)
                        RecurringSummary()
                    }
                }
            }.background(Color(hex:0xF8F4F0)).navigationTitle("Recurring Bills")
        }
    }
}

#Preview {
    RecurringBillView()
}
