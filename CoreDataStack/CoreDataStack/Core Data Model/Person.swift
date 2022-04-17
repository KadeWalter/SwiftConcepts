//
//  Person.swift
//  CoreDataStack
//
//  Created by Kade Walter on 4/17/22.
//

import Foundation
import CoreData

@objc(Person)
final class Person: NSManagedObject {
    @NSManaged var name: String
    @NSManaged var age: Int64
    
    class func savePerson(withName name: String, andAge age: Int, context: NSManagedObjectContext) {
        let age64 = Int64(age)
        
        let newPerson = Person(context: context)
        newPerson.name = name
        newPerson.age = age64
        
        if context.hasChanges {
            do {
                try context.save()
            } catch {
                fatalError("Error saving context.")
            }
        }
    }
}
