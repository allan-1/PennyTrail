//
//  SavedComponets.swift
//  PennyTrail
//
//  Created by Allan on 12/12/24.
//

import SwiftUI

struct SavedComponets: View {
    var amountSaved: String
    var body: some View {
        HStack{
            Image("bank").resizable().frame(width: 40, height: 40).padding(.all)
            VStack(alignment: .leading){
                Text("Total Saved").foregroundStyle(Color(hex: 0x696868)).padding(.bottom, 8).padding(.top)
                Text("$\(amountSaved)").fontWeight(/*@START_MENU_TOKEN@*/.bold/*@END_MENU_TOKEN@*/).font(/*@START_MENU_TOKEN@*/.title/*@END_MENU_TOKEN@*/).padding(.bottom)
            }
        }.frame(maxWidth: .infinity, alignment: .leading).background(Color(hex: 0xF8F4F0)).clipShape(RoundedRectangle(cornerRadius: 10)).shadow(radius: 0)
            .padding(.horizontal, 10).padding(.bottom, 10)
    }
}

#Preview {
    SavedComponets(amountSaved: "1,000")
}
