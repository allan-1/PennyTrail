//
//  BudgetItemDescription.swift
//  PennyTrail
//
//  Created by Allan on 12/13/24.
//

import SwiftUI

struct BudgetItemDescription: View {
    var body: some View {
        VStack(alignment: .leading){
            HStack{
                Rectangle().frame(width: 20, height: 20).clipShape(/*@START_MENU_TOKEN@*/Circle()/*@END_MENU_TOKEN@*/)
                Text("Entertainment").fontWeight(/*@START_MENU_TOKEN@*/.bold/*@END_MENU_TOKEN@*/).font(/*@START_MENU_TOKEN@*/.title/*@END_MENU_TOKEN@*/)
                Spacer()
                Button{
                    
                }label: {
                    Image(systemName: "ellipsis").foregroundStyle(Color(.black))
                }
            }.padding()
            Text("Maximum of $4,000").font(.callout).foregroundStyle(Color(hex: 0x696868)).padding(.horizontal)
            ProgressView(value: 0.1).progressViewStyle(CustomProgressBar())
            HStack{
                SavedItemComponent()
                SavedItemComponent()
            }.padding()
            TransactionComponent(titleText: "Latest Spending", buttonText: "View All", backcolor: 0xF8F4F0, transList: []).padding(.bottom)
        }.frame(maxWidth: .infinity)
            .background(Color.white)
            .cornerRadius(10)
            .shadow(radius: 0)
            .padding(.horizontal, 20)
    }
}

struct CustomProgressBar: ProgressViewStyle {
    func makeBody(configuration: Configuration) -> some View {
        ZStack(alignment: .leading) {
            Rectangle()
                .frame(maxWidth: .infinity, maxHeight: 30)
                .foregroundStyle(Color(hex: 0xF8F4F0))
                .cornerRadius(4)
            Rectangle()
                .frame(
                    width: (300 * CGFloat(configuration.fractionCompleted ?? 0.0)).clamped(to: 0...300),
                    height: 25
                )
                .cornerRadius(4)
                .padding(.horizontal, 4)
                .foregroundStyle(Color(hex: 0xF2CDAC))
        }
        .cornerRadius(4)
        .padding(.horizontal)
    }
}

#Preview {
    BudgetItemDescription()
}
