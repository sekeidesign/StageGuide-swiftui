//
//  SGActViewModel.swift
//  StageGuide
//
//  Created by Piergiorgio Gonni on 2023-08-19.
//

import SwiftUI

class ActViewModel: ObservableObject {
    @Published var act: Act
    var toggleFavorite: () -> Void
    
    init(act: Act, toggleAction: @escaping () -> Void) {
        self.act = act
        self.toggleFavorite = toggleAction
    }
    
    func toggleFavoriteStatus() {
        act.isFavorite.toggle()
        toggleFavorite() // Call the provided toggle action
        
        // Save changes to Core Data context
        do {
            try act.managedObjectContext?.save()
        } catch {
            print("Error saving context: \(error)")
        }
        
        // Manually trigger objectWillChange to update the UI
        objectWillChange.send()
    }
}
