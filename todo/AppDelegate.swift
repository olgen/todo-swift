//
//  AppDelegate.swift
//  todo
//
//  Created by Eugen on 21/06/14.
//  Copyright (c) 2014 olgen. All rights reserved.
//

import CoreData
import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {
                            
    var window: UIWindow?


    func application(application: UIApplication, didFinishLaunchingWithOptions launchOptions: NSDictionary?) -> Bool {
        // Override point for customization after application launch.
        taskMgr.loadTasks()
        return true
    }

    func applicationWillResignActive(application: UIApplication) {
    }

    func applicationDidEnterBackground(application: UIApplication) {
    }

    func applicationWillEnterForeground(application: UIApplication) {
    }

    func applicationDidBecomeActive(application: UIApplication) {
    }

    func applicationWillTerminate(application: UIApplication) {
        self.saveContext()
    }
    
    func saveContext () {
        var error: NSError? = nil
        let managedObjectContext = self.managedObjectContext
        if managedObjectContext != nil {
            if managedObjectContext.hasChanges && !managedObjectContext.save(&error) {
                abort()
            }
        }
    }
    
    // #pragma mark - Core Data stack
    
    var managedObjectContext: NSManagedObjectContext {
    if !_managedObjectContext {
        let coordinator = self.persistentStoreCoordinator
        if coordinator != nil {
            _managedObjectContext = NSManagedObjectContext()
            _managedObjectContext!.persistentStoreCoordinator = coordinator
        }
        }
        return _managedObjectContext!
    }
    var _managedObjectContext: NSManagedObjectContext? = nil
    
    var managedObjectModel: NSManagedObjectModel {
    if !_managedObjectModel {
        let modelURL = NSBundle.mainBundle().URLForResource("Model", withExtension: "momd")
        _managedObjectModel = NSManagedObjectModel(contentsOfURL: modelURL)
        }
        return _managedObjectModel!
    }
    var _managedObjectModel: NSManagedObjectModel? = nil
    
    var persistentStoreCoordinator: NSPersistentStoreCoordinator {
    if !_persistentStoreCoordinator {
        let storeURL = self.applicationDocumentsDirectory.URLByAppendingPathComponent("test.sqlite")
        var error: NSError? = nil
        _persistentStoreCoordinator = NSPersistentStoreCoordinator(managedObjectModel: self.managedObjectModel)
        if _persistentStoreCoordinator!.addPersistentStoreWithType(NSSQLiteStoreType, configuration: nil, URL: storeURL, options: nil, error: &error) == nil {
            abort()
        }
        }
        return _persistentStoreCoordinator!
    }
    var _persistentStoreCoordinator: NSPersistentStoreCoordinator? = nil
    
    var applicationDocumentsDirectory: NSURL {
    let urls = NSFileManager.defaultManager().URLsForDirectory(.DocumentDirectory, inDomains: .UserDomainMask)
        return urls[urls.endIndex-1] as NSURL
    }


}

