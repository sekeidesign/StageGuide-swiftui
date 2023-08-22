//
//  PersistenceController.swift
//  StageGuide
//
//  Created by Piergiorgio Gonni on 2023-08-17.
//

import CoreData

struct PersistenceController {
    static let shared = PersistenceController()
    
    let container: NSPersistentContainer
    
    init() {
        container = NSPersistentContainer(name: "Riverside")
        container.loadPersistentStores { (description, error) in
            if let error = error {
                fatalError("Error: \(error.localizedDescription)")
            }
        }
    }
    
    func save(completion: @escaping (Error?) -> () = {_ in}) {
        let context = container.viewContext
        if context.hasChanges {
            do {
                try context.save()
            } catch {
                completion(error)
            }
        }
    }
    
    func delete(_ object: NSManagedObject, completion: @escaping (Error?) -> () = {_ in}) {
        let context = container.viewContext
        context.delete(object)
        save(completion: completion)
    }
    
    func deleteAllData() -> Void {
        
        UserDefaults.standard.set(false, forKey: "HasLaunchedBefore")
        
        // Get a reference to a NSPersistentStoreCoordinator
        let storeContainer =
        container.persistentStoreCoordinator
        
        // Delete each existing persistent store
        for store in storeContainer.persistentStores {
            do {
                try storeContainer.destroyPersistentStore(
                    at: store.url!,
                    ofType: store.type,
                    options: nil
                )} catch {}
        }
        
        // Re-create the persistent container
        let persistentContainer = NSPersistentContainer(
            name: "Riverside"
        )
        
        // Calling loadPersistentStores will re-create the
        // persistent stores
        persistentContainer.loadPersistentStores {
            (store, error) in
            print("Error in \(store): \(String(describing: error?.localizedDescription))")
        }
    }
}
