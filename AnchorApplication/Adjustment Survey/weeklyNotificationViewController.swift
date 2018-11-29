//
//  weeklyNotificationViewController.swift
//  AnchorApplication
//
//  Created by Keith Leung on 2018-11-27.
//  Copyright © 2018 Keith Leung. All rights reserved.
//

import UIKit
import UserNotifications

// To prevent one-time notification
extension weeklyNotificationViewController : UNUserNotificationCenterDelegate{
    func userNotificationCenter(_ center: UNUserNotificationCenter, willPresent notification: UNNotification, withCompletionHandler completionHandler: @escaping (UNNotificationPresentationOptions) -> Void) {
        completionHandler([.alert, .sound, .badge])
    }
}

class weeklyNotificationViewController: UIViewController {
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        UNUserNotificationCenter.current().delegate = self
        createNotification()
   
    }

    func createNotification() {
        // Use let weekinSeconds for proper weekly notification
        // 7 days = 604800 seconds
        // let weekInSeconds = TimeInterval(604800)
        
        // Testing notification delay of 5 seconds
        let testDelay = 5.0
        
        // Alarm message configuration
        let content = UNMutableNotificationContent()
        content.title = "Reminder"
        content.body = "Follow-up by conducting the adjustment survey again!"
        content.categoryIdentifier = "alarm"
        content.sound = UNNotificationSound.default()
        
        // Use the below code for proper weekly notification
        // let triggerWeekly = UNTimeIntervalNotificationTrigger(timeInterval: weekInSeconds, repeats: false)
        // let request = UNNotificationRequest(identifier: "test", content: content, trigger: triggerWeekly)
        
        // For testing purposes
        let testTrigger = UNTimeIntervalNotificationTrigger(timeInterval: testDelay, repeats: false)
        let request = UNNotificationRequest(identifier: "test", content: content, trigger: testTrigger)
        
        // Add notification request to notification center
        let center = UNUserNotificationCenter.current()
        center.add(request) { (error) in
            if let error = error {
                print(error)
            }
        }
    }
}
