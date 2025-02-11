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
    
    init(modelContext: ModelContext) {
        self.modelContext = modelContext
        fetchPots()
    }
    
    var totalSaved: Double{
        pots.reduce(0){$0 + $1.saved}
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
    
    func updatePot(name: String, target: Double, theme: ThemeModel, pot: PotsModel){
        pot.target = target
        pot.theme = theme
        pot.name = name
        savePot()
        fetchPots()
    }
    
    func addMoney(saved: Double, pot: PotsModel){
        let newAmount = pot.saved + saved
        pot.saved = newAmount
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
