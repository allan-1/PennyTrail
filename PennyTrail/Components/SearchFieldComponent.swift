//
//  SearchFieldComponent.swift
//  PennyTrail
//
//  Created by Allan on 12/13/24.
//

import SwiftUI

struct SearchFieldComponent: View {
    @State var searchText: String
    var body: some View {
        ZStack(alignment: .trailing){
                TextField("Search transactions", text: $searchText).autocorrectionDisabled()
            Button{
            }label:{
                Image(systemName:"magnifyingglass").tint(.black)
            }.padding(.trailing, 4)
        }
    }
}

#Preview {
    SearchFieldComponent(searchText: "")
}
