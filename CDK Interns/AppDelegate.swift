//
//  AppDelegate.swift
//  CDK Interns
//
//  Created by Strull, Brian on 7/15/15.
//  Copyright (c) 2015 CDK Global, LLC. All rights reserved.
//

import UIKit


@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {
    var window: UIWindow?
    
    
    func application(application: UIApplication, didFinishLaunchingWithOptions launchOptions: [NSObject: AnyObject]?) -> Bool {
        DataManager.sharedInstance?.updateFromFileAsync()
        
        /*

        DataManager.getInternDataFromFileWithSuccess { (data) -> Void in
            let json = JSON(data: data)
            if let myAuthors = json["authors"].array{
                for a in myAuthors{
                    println(a)
                    var newIntern = Intern(json: a)
                    interns[newIntern.id] = newIntern
                }
            }
        }
        
        DataManager.getMessageDataFromFileWithSuccess { (data) -> Void in
            let json2 = JSON(data: data)
            if let myMessages = json2["events"].array{
                print("Local count: \(myMessages.count)")
                for m in myMessages{                    println(m)
                    var newMessage = Message(json: m)
                    messages[newMessage.id] = newMessage
                }
            }
            else{
                println("fail")
            }
            print("Global count: \(messages.count)")
            
        }


        */
        
        /*
        DataManager.updateFromFileWithSuccess { (data) -> Void in
            var eventSequence : [Event]
            let json = JSON(data: data)
            if let jsonEvents = json["events"].array {
                for je in jsonEvents {
                    if let e = Event(json: je) {
                        eventSequence.append(e)
                    }
                }
                
                eventSequence.sort { $0.timestamp > $1.timestamp }
            }
        }
        */
        
     


        
        let types = UIUserNotificationSettings(forTypes: UIUserNotificationType.Alert | UIUserNotificationType.Sound | UIUserNotificationType.Badge, categories: nil)
        UIApplication.sharedApplication().registerUserNotificationSettings(types)
        UIApplication.sharedApplication().registerForRemoteNotifications()
        
//        let notificationTypes:UIUserNotificationType = UIUserNotificationType.Alert | UIUserNotificationType.Badge | UIUserNotificationType.Sound
//        let notificationSettings:UIUserNotificationSettings = UIUserNotificationSettings(forTypes: notificationTypes, categories: nil)
//        
//        UIApplication.sharedApplication().registerUserNotificationSettings(notificationSettings)
//        
//        // somewhere when your app starts up
//        UIApplication.sharedApplication().registerForRemoteNotifications()
        
        return true

    }
    
//    func application(application: UIApplication!, didRegisterUserNotificationSettings notificationSettings: UIUserNotificationSettings!) {
//        UIApplication.sharedApplication().registerForRemoteNotifications()
//    }
//    
//    func application(application: UIApplication!, didRegisterForRemoteNotificationsWithDeviceToken deviceToken: NSData!) {
//        let currentInstallation: PFInstallation = PFInstallation.currentInstallation()
//        currentInstallation.setDeviceTokenFromData(deviceToken)
//        currentInstallation.saveInBackground()
//        let foo =
//    }
//    
//    func application(application: UIApplication!, didFailToRegisterForRemoteNotificationsWithError error: NSError!) {
//        println(error.localizedDescription)
//    }
    
    func application(application: UIApplication, didRegisterForRemoteNotificationsWithDeviceToken deviceToken: NSData) {
        println("Got token data! \(deviceToken)")
    }
    
    func application(application: UIApplication, didFailToRegisterForRemoteNotificationsWithError error: NSError) {
        println("Couldn't register: \(error)")
    }

    func applicationWillResignActive(application: UIApplication) {
        // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
        // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
    }

    func applicationDidEnterBackground(application: UIApplication) {
        // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
        // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
    }

    func applicationWillEnterForeground(application: UIApplication) {
        // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
    }

    func applicationDidBecomeActive(application: UIApplication) {
        // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
    }

    func applicationWillTerminate(application: UIApplication) {
        // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
    }


}

