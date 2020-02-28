//
//  CoreDataStack.swift
//  0MVC-Swift2-iOS
//
//  Created by macOS on 11/12/19.
//  Copyright © 2019 macOS. All rights reserved.
//

//https:/ /stackoverflow.com/questions/39235468/accessing-core-data-context-in-viewcontroller-properly-in-ios
//

import Foundation
import CoreData

class CoreDataStack {
    /*
    lazy var context: NSManagedObjectContext = {
    
    var managedObjectContext = NSManagedObjectContext(
    concurrencyType: .mainQueueConcurrencyType)
    
    managedObjectContext.persistentStoreCoordinator = self.psc
    return managedObjectContext
    }()
    
    lazy var psc: NSPersistentStoreCoordinator = {
    
    let coordinator = NSPersistentStoreCoordinator(
    managedObjectModel: self.managedObjectModel)
    
    let url = self.applicationDocumentsDirectory
    .appendingPathComponent(self.modelName)
    
    do {
    let options =
    [NSMigratePersistentStoresAutomaticallyOption : true]
    
    try coordinator.addPersistentStore(
    ofType: NSSQLiteStoreType, configurationName: nil, at: url,
    options: options)
    } catch  {
    print("Error adding persistent store.")
    }
    
    return coordinator
    }()
    
    lazy var managedObjectModel: NSManagedObjectModel = {
    
    let modelURL = Bundle.main
    .url(forResource: self.modelName,
    withExtension: "momd")!
    return NSManagedObjectModel(contentsOf: modelURL)!
    }()
    
    lazy var applicationDocumentsDirectory: URL = {
    let urls = NSFileManager.defaultManager().URLsForDirectory(NSSearchPathDirectory.AllApplicationsDirectory, inDomains: NSSearchPathDomainMask.AllDomainsMask)
    return urls[urls.count-1]
    }()
    
    func saveContext () {
    if context.hasChanges {
    do {
    try context.save()
    } catch let error as NSError {
    print("Error: \(error.localizedDescription)")
    abort()
    }
    }
    }
    */
    
}