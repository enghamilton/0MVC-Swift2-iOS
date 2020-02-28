//
//  CoreData.swift
//  0MVC-Swift2-iOS
//
//  Created by macOS on 10/12/19.
//  Copyright © 2019 macOS. All rights reserved.
//

import UIKit
import CoreData

extension EditSecondViewController {
    
    //stackoverflow.com/questions/32235630/swift-2-core-data-does-not-seem-to-work
    
    //MARK: Store user info on Device D    
    func saveUserInfoOnDB()
    {
        
        let entityObj =
        NSEntityDescription.entityForName("Product",
            inManagedObjectContext: self.managedObjContext)
        let userObj = Product(entity: entityObj!,
            insertIntoManagedObjectContext: self.managedObjContext)
        
        userObj.id = 1
        userObj.name = "user" //name.text
        userObj.price = "" //password.text
        userObj.itemDescription = "" //cell.text
        
        if self.managedObjContext.hasChanges
        {
            do
            {
                try self.managedObjContext.save()
                let error: NSError? = nil
                
                if let err = error
                {
                    print("%@",err.localizedFailureReason)
                    print("Could not saved \(error), \(err.userInfo)")
                    
                } else {
                    //name.text = ""
                    //password.text = ""
                    //cell.text = ""
                    //print("User info Saved")
                    
                    performSegueWithIdentifier("loadManageAccountSegue", sender: nil)
                }
            }
            catch
            {
                let nserror = error as NSError
                NSLog("Unresolved error \(nserror), \(nserror.userInfo)")
                abort()
            }
        }
    }
    
    func save(name :String){
        
        /*
        guard let appDelegate = UIApplication.sharedApplication().delegate as? AppDelegate else {
            return
        }
        */
        
        //let managedContext = appDelegate.persistentStoreCoordinator.
        
        //let entity = NSEntityDescription.entityForName("product", inManagedObjectContext: managedContext)
    }

}