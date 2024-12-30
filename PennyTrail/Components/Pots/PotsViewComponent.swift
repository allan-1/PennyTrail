//
//  PotsViewComponent.swift
//  PennyTrail
//
//  Created by Allan on 12/13/24.
//

import SwiftUI

struct PotsViewComponent: View {
    var potItem: PotsModel
    var body: some View {
        VStack(alignment: .leading){
            HStack{
                Rectangle().frame(width: 15, height: 15).clipShape(/*@START_MENU_TOKEN@*/Circle()/*@END_MENU_TOKEN@*/).foregroundStyle(Color(hex: potItem.theme.color)).padding(.trailing, 8)
                Text(potItem.name).fontWeight(/*@START_MENU_TOKEN@*/.bold/*@END_MENU_TOKEN@*/).font(.title2)
                Spacer()
                Button{
                    
                }label: {
                    Image(systemName: "ellipsis").foregroundStyle(Color(.black))
                }
            }.padding()
            HStack{
                Text("Total Saved").foregroundStyle(Color(hex: 0x696868))
                Spacer()
                Text("$\(potItem.saved, specifier: "%.2f")").fontWeight(/*@START_MENU_TOKEN@*/.bold/*@END_MENU_TOKEN@*/).font(/*@START_MENU_TOKEN@*/.title/*@END_MENU_TOKEN@*/)
            }.padding()
            ProgressView(value: potItem.saved / potItem.target).progressViewStyle(CustomProgressBarStyle(themeColor: potItem.theme.color))
            HStack{
                Text("\((potItem.saved / potItem.target) * 100, specifier: "%.2f")%").foregroundStyle(Color(hex: 0x696868)).fontWeight(/*@START_MENU_TOKEN@*/.bold/*@END_MENU_TOKEN@*/)
                Spacer()
                Text("Target of $\(potItem.target, specifier: "%.2f")").foregroundStyle(Color(hex: 0x696868))
            }.padding()
            HStack{
                Button{
                    
                }label: {
                    Text("+ Add Money").padding(10).foregroundStyle(Color(hex: 0x201F24)).fontWeight(.bold)
                }.buttonStyle(.borderedProminent).tint(Color(hex: 0xF8F4F0))
                Spacer()
                Button{
                    
                }label: {
                    Text("Withdraw").padding(.vertical, 10).padding(.horizontal, 20).foregroundStyle(Color(hex: 0x201F24)).fontWeight(.bold)
                }.buttonStyle(.borderedProminent).tint(Color(hex: 0xF8F4F0))
            }.padding()
        }.frame(maxWidth: .infinity)
            .background(Color.white)
            .cornerRadius(10)
            .shadow(radius: 0)
            .padding(.horizontal, 20)
    }
}

struct CustomProgressBarStyle: ProgressViewStyle{
    var themeColor: Int
    func makeBody(configuration: Configuration) -> some View {
        ZStack(alignment: .leading) {
            Rectangle()
                .frame(maxWidth: .infinity, maxHeight: 15)
                .foregroundStyle(Color(hex: 0xF8F4F0))
                .cornerRadius(4)
            Rectangle()
                .frame(
                    width: (300 * CGFloat(configuration.fractionCompleted ?? 0.0)).clamped(to: 0...300),
                    height: 15
                )
                .cornerRadius(4)
                .foregroundStyle(Color(hex: themeColor))
        }
        .cornerRadius(4)
        .padding(.horizontal)
    }
}

//#Preview {
//    PotsViewComponent()
//}
