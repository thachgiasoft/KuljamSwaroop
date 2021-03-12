//
//  Persistence.swift
//  PizzaRestaurant
//
//  Created by Andreas Schultz on 25.09.20.
//

import Foundation
import CoreData

final class PersistenceProvider {
    enum StoreType {
        case inMemory, persisted
    }
    
    static var managedObjectModel: NSManagedObjectModel = {
        
        let bundle = Bundle(for: PersistenceProvider.self)
        guard let url = bundle.url(forResource: "NijanandData", withExtension: "momd") else {
            fatalError("Failed to locate momd file for Kuljam Swaroop")
        }
        guard let model = NSManagedObjectModel(contentsOf: url) else {
            fatalError("Failed to load momd file for Kuljam Swaroop")
        }
        return model
    }()
    
    let persistentContainer: NSPersistentContainer
    
    var context: NSManagedObjectContext { persistentContainer.viewContext }
    var backgroundContext: NSManagedObjectContext { persistentContainer.newBackgroundContext() }
    
    static let `default`: PersistenceProvider = PersistenceProvider()
    
    init(storeType: StoreType = .persisted) {
        persistentContainer = NSPersistentContainer(name: "NijanandData", managedObjectModel: Self.managedObjectModel)
        
        if storeType == .inMemory {
            persistentContainer.persistentStoreDescriptions.first!.url = URL(fileURLWithPath: "/dev/null")
        }
        
        persistentContainer.loadPersistentStores { (_, error) in
            if let error = error {
                fatalError("Failed loading persistent stores with error: \(error.localizedDescription)")
            }
        }
    }
}
