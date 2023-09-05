//
//  SGActViewModel.swift
//  StageGuide
//
//  Created by Piergiorgio Gonni on 2023-08-19.
//

import SwiftUI

// Fetch request core data

class ActViewModel: ObservableObject {
    @Published var act: Act
    var toggleFavorite: () -> Void
    let persistenceController = PersistenceController.shared
    
    init(act: Act, toggleAction: @escaping () -> Void) {
        self.act = act
        self.toggleFavorite = toggleAction
    }
    
    func toggleFavoriteStatus() {
        
        act.isFavorite.toggle()
        
        toggleFavorite()
        
        persistenceController.save()
        objectWillChange.send()
        
    }
}

// Generate for each act

