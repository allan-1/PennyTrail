//
//  TotalBillsComponent.swift
//  PennyTrail
//
//  Created by Allan on 12/14/24.
//

import SwiftUI

struct TotalBillsComponent: View {
    var body: some View {
        HStack{
            Image(systemName: "line.3.horizontal.button.angledtop.vertical.right.fill").font(/*@START_MENU_TOKEN@*/.title/*@END_MENU_TOKEN@*/).foregroundStyle(Color.white).padding()
            VStack(alignment: .leading){
                Text("Total Bills").foregroundStyle(Color.white).padding(.top).padding(.leading)
                Text("$384.98").font(/*@START_MENU_TOKEN@*/.title/*@END_MENU_TOKEN@*/).fontWeight(/*@START_MENU_TOKEN@*/.bold/*@END_MENU_TOKEN@*/).foregroundStyle(Color.white).padding()
            }
        }.frame(maxWidth: .infinity)
            .background(Color.black)
            .cornerRadius(10)
            .shadow(radius: 0)
            .padding(.horizontal, 20)
    }
}
