//
//  CardHeaderComponents.swift
//  PennyTrail
//
//  Created by Allan on 12/12/24.
//

import SwiftUI

struct CardHeaderComponents: View {
    var titleText: String
    var buttonText: String
    var buttonAction: () -> Void
    
    var body: some View {
        HStack(){
            Text(titleText).fontWeight(/*@START_MENU_TOKEN@*/.bold/*@END_MENU_TOKEN@*/).font(.title2).foregroundStyle(Color(hex: 0x201F24))
            Spacer()
            Button(action: buttonAction){
                HStack{
                    Text(buttonText).foregroundStyle(Color(hex: 0x696868))
                    Image(systemName: "arrowtriangle.right.fill").foregroundStyle(Color(hex: 0x696868))
                }
            }
        }
    }
}

#Preview {
    CardHeaderComponents(titleText: "Pots", buttonText: "View More", buttonAction: {})
}
