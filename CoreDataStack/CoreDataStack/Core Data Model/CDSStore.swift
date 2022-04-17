//
//  CDSStore.swift
//  CoreDataStack
//
//  Created by Kade Walter on 4/17/22.
//

import Foundation
import CoreData

class CDSStore: NSObject {
    
    let persistentContainer: NSPersistentContainer = {
        // Create the NSPersistentContainer object with name of the .xcdatamodel
        let container = NSPersistentContainer(name: "CoreDataStack")
        
        // Load the persistent stores if they exist.
        // If they don't exist, it will create them.
        // If there is an error along the way, it will return the error.
        container.loadPersistentStores() { desc, error in
            if let error = error {
                print("Error setting up Core Data: \(error)")
            }
        }
        return container
    }()
}
