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

    @IBOutlet var notificatieLabel: WKInterfaceLabel!
    @IBOutlet var optredenLabel: WKInterfaceLabel!
    @IBOutlet var artiestLabel: WKInterfaceLabel!
    @IBOutlet var festivalLabel: WKInterfaceLabel!
    @IBOutlet var tijdLabel: WKInterfaceLabel!
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

    override func didReceiveRemoteNotification(_ remoteNotification: [AnyHashable : Any], withCompletion completionHandler: @escaping (WKUserNotificationInterfaceType) -> Void) {
        
    }
    
    override func didReceive(_ localNotification: UILocalNotification, withCompletion completionHandler: @escaping (WKUserNotificationInterfaceType) -> Void) {
        print("Local")
    }
    
//    func didReceiveLocalNotification(
//        localNotification: UILocalNotification, withCompletion
//        completionHandler: ((WKUserNotificationInterfaceType) -> Void)) {
//        // The iOS app received a local notification; set up our interface
//        print("Local")
//        self.notificatieLabel.setText("Notificatie")
//        self.optredenLabel.setText(localNotification.alertTitle?.appending(" Optreden"))
//        self.artiestLabel.setText("Festival")
//        // When done, call completionHandler and pass .Custom.
//        completionHandler(.custom)
//    }
//    
//    func didReceiveRemoteNotification(
//        remoteNotification: [NSObject : AnyObject], withCompletion
//        completionHandler: ((WKUserNotificationInterfaceType) -> Void)) {
//        // The iOS app received a local notification; set up our interface
//        
//        // When done, call completionHandler and pass .Custom.
//        completionHandler(.custom)
//    }
    
}
