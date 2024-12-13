//
//  TransactionView.swift
//  PennyTrail
//
//  Created by Allan on 12/13/24.
//

import SwiftUI

struct TransactionView: View {
    var body: some View {
        NavigationStack{
            ZStack{
                Color(hex:0xF8F4F0)
            }.background(Color(hex:0xF8F4F0)).navigationTitle("Transactions").toolbar{
                ToolbarItem(placement: .topBarTrailing){
                    Button{
                        
                    }label: {
                        Text("+ Transaction")
                    }.buttonStyle(.borderedProminent).tint(.black)
                }
            }
        }
    }
}

#Preview {
    TransactionView()
}
