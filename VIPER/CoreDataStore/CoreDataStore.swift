//
//  CoreDataStore.swift
//  VIPER
//
//  Created by ABA IT on 1/22/18.
//  Copyright © 2018 ABA IT. All rights reserved.
//

import UIKit
import CoreData

class CoreDataStore {
    
    private static var appDelegate : AppDelegate? {
        return UIApplication.shared.delegate as? AppDelegate
    }

    static var persistentStoreCoordinator : NSPersistentStoreCoordinator? {
        if let deletage = self.appDelegate {
            return deletage.persistentContainer.persistentStoreCoordinator
        }
        return nil
    }
    
    static var managedObjectModel : NSManagedObjectModel? {
        if let delegate = self.appDelegate {
            return delegate.persistentContainer.managedObjectModel
        }
        return nil
    }

    static var managedObjectContext : NSManagedObjectContext? {
        if let delegate = self.appDelegate {
            return delegate.persistentContainer.viewContext
        }
        return nil
    }
    
}
