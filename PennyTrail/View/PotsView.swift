//
//  PotsView.swift
//  PennyTrail
//
//  Created by Allan on 12/13/24.
//

import SwiftUI
import SwiftData

struct PotsView: View {
    
    @StateObject var potsViewModel: PotsViewModel
    
    @State private var isShowingSheet = false
    
    init(modelContext: ModelContext){
        _potsViewModel = StateObject(wrappedValue: PotsViewModel(modelContext: modelContext))
    }
    
    var body: some View {
        NavigationStack{
            ZStack{
                Color(hex:0xF8F4F0)
                ScrollView{ VStack{
                    PotsViewComponent()
                }
                }
            }.background(Color(hex:0xF8F4F0)).navigationTitle("Pots").toolbar{
                ToolbarItem(placement: .topBarTrailing){
                    Button{
                        isShowingSheet.toggle()
                    }label: {
                        Image(systemName: "plus.circle.fill").font(.title2)
                    }.tint(.black)
                }
            }.sheet(isPresented: $isShowingSheet) {
                AddPotSheet(isPresented: $isShowingSheet, potsViewModel: potsViewModel)
                }
        }
    }
}

//#Preview {
//    PotsView()
//}
