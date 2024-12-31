//
//  AddPotSheet.swift
//  PennyTrail
//
//  Created by Allan on 12/30/24.
//

import SwiftUI

struct AddPotSheet: View {
    @Binding var isPresented: Bool
    @State private var potName: String = ""
    @State private var amount: String = ""
    @State private var themeColor: ThemeModel = ThemeModel(name: "Red", color: 0xFF0000)
    
    var potsViewModel: PotsViewModel
    
    var body: some View {
        ScrollView{
            VStack(alignment: .leading){
                Text("Add New Pot").font(.title).fontWeight(.bold).padding()
                Text("Create a pot to set savings targets. These can help keep you on track as you save for special purchases.").padding().foregroundStyle(Color(hex: 0x696868))
                Text("Pot Name").padding(.horizontal).foregroundStyle(Color(hex: 0x696868))
                TextField("", text: $potName).autocorrectionDisabled().padding(.bottom).padding(.horizontal)
                Text("Amount").padding(.horizontal).foregroundStyle(Color(hex: 0x696868))
                TextField("e.g 1000", text: $amount).keyboardType(.decimalPad).autocorrectionDisabled().padding(.bottom).padding(.horizontal)
                Text("Theme").padding(.horizontal).foregroundStyle(Color(hex: 0x696868))
                ColorDropDown(selectedColor: $themeColor)
                Button{
                    potsViewModel.addPot(name: potName, saved: 0.0, target: Double(amount) ?? 0.0, theme: themeColor)
                    isPresented = false
                } label: {
                    Text("Add Pot").fontWeight(.bold).frame(maxWidth: .infinity)
                }.buttonStyle(.borderedProminent).tint(.black).padding(.bottom, 32).padding(.horizontal).padding(.top)
            }.textFieldStyle(.roundedBorder)
        }
    }
}

//#Preview {
//    AddPotSheet(isPresented: true)
//}
