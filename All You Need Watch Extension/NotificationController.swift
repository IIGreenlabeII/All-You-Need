//
//  NotificationController.swift
//  All You Need Watch Extension
//
//  Created by Shailin Biharie on 04-09-16.
//  Copyright © 2016 Shailin Biharie. All rights reserved.
//

import WatchKit
import Foundation


class NotificationController: WKUserNotificationInterfaceController {

    override init() {
        // Initialize variables here.
        super.init()
        // Configure interface objects here.
    }

    override func willActivate() {
        // This method is called when watch view controller is about to be visible to user
        super.willActivate()
    }

    override func didDeactivate() {
        // This method is called when watch view controller is no longer visible
        super.didDeactivate()
    }

    func didReceiveLocalNotification(localNotification: UILocalNotification, withCompletion completionHandler: ((WKUserNotificationInterfaceType) -> Void)) {
        
        if localNotification.alertTitle != " " {
            print("Yo")
        }
        
        completionHandler(.custom)
    }
    
}
