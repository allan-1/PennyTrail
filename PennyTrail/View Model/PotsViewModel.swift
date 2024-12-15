//
//  PotsViewModel.swift
//  PennyTrail
//
//  Created by Allan on 12/15/24.
//

import Foundation
import SwiftData

class PotsViewModel: ObservableObject{
    @Published var pots: [PotsModel] = []
    let modelContext: ModelContext
    
    init(pots: [PotsModel], modelContext: ModelContext) {
        self.pots = pots
        self.modelContext = modelContext
        fetchPots()
    }
    
    func fetchPots(){
        do{
            try pots = modelContext.fetch(FetchDescriptor<PotsModel>())
        }catch{
            print("Failed to catch pots: \(error)")
        }
    }
    
    func addPot(name: String, saved: Double, target: Double, theme: ThemeModel){
        let newPot = PotsModel(name: name, saved: saved, target: target, theme: theme)
        modelContext.insert(newPot)
        savePot()
        fetchPots()
    }
    
    func updatePot(saved: Double, target: Double, pot: PotsModel){
        pot.saved = saved
        pot.target = target
        savePot()
        fetchPots()
    }
    
    func deletePot(_ pots: PotsModel){
        modelContext.delete(pots)
        savePot()
        fetchPots()
    }
    
    private func savePot(){
        do{
            try modelContext.save()
        }catch{
            print("Failed to save changes: \(error)")
        }
    }
}
