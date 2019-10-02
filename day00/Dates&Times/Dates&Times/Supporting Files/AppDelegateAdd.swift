//
//  AppDelegateAdd.swift
//  Dates&Times
//
//  Created by jeffrey chiang on 10/1/19.
//  Copyright © 2019 jeffrey chiang. All rights reserved.
//

import Foundation
import UserNotifications
import UIKit

extension AppDelegate: UNUserNotificationCenterDelegate {
    
    func userNotificationCenter(_ center: UNUserNotificationCenter, didReceive response: UNNotificationResponse, withCompletionHandler completionHandler: @escaping () -> Void)
    {
        let id = response.notification.request.identifier
        print("Received notification with ID = \(id)")

        completionHandler()
    }
    
    func userNotificationCenter(_ center: UNUserNotificationCenter, willPresent notification: UNNotification, withCompletionHandler completionHandler: @escaping (UNNotificationPresentationOptions) -> Void)
    {
        let id = notification.request.identifier
        print("Received notification with ID = \(id)")

        completionHandler([.sound, .alert])
    }
}
