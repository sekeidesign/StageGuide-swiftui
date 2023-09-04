//
//  YourScheduleView-ViewModel.swift
//  StageGuide
//
//  Created by Piergiorgio Gonni on 2023-09-03.
//

import Foundation
import CoreData

extension YourScheduleView {
    @MainActor class ViewModel: ObservableObject {
        @Published var isFestivalLive = false
        let container: NSPersistentContainer
        private var matchingDays: [Day]?
        
        init() {
            container = NSPersistentContainer(name: "Riverside")
            container.loadPersistentStores { (description, error) in
                if let error = error {
                    fatalError("Error: \(error.localizedDescription)")
                }
            }
        }
        
        func hasFestivalStarted() -> Bool {
            let matchingDaysRequest = NSFetchRequest<NSFetchRequestResult>(entityName: "Day")
            let matchingDaysPredicate = NSPredicate(format: "startTime <= %@ AND endTime >= %@", Date() as CVarArg, Date() as CVarArg)
            matchingDaysRequest.predicate = matchingDaysPredicate
            
            do {
                matchingDays = try container.viewContext.fetch(matchingDaysRequest) as? [Day]
            } catch {
                print("Fetch failed")
            }
            
            // check if the festival has started but not ended yet
            guard matchingDays?[0] != nil else {
                print("Festival hasn't started yet, or has already ended")
                return false
            }
            print("Festival day has started")
            return true
        }

    }
}
