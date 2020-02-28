//
//  Product+CoreDataProperties.swift
//  0MVC-Swift2-iOS
//
//  Created by macOS on 11/12/19.
//  Copyright © 2019 macOS. All rights reserved.
//
//  Choose "Create NSManagedObject Subclass…" from the Core Data editor menu
//  to delete and recreate this implementation file for your updated model.
//

import Foundation
import CoreData

extension Product {

    @NSManaged var id: Int16
    @NSManaged var name: String?
    @NSManaged var itemDescription: String?
    @NSManaged var price: String?

}
