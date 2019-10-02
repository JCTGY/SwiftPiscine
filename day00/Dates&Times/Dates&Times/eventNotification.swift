//
//  eventNotification.swift
//  Dates&Times
//
//  Created by jeffrey chiang on 10/1/19.
//  Copyright © 2019 jeffrey chiang. All rights reserved.
//

import Foundation
import UserNotifications

class eventNotification {
    
    var notifications = [Notification]()
    var eventID: Int = 0
    
    func addNotification(currentTitle: String, currentTime: DateComponents) {
        
        notifications.append(Notification.init(id: eventID, title: currentTitle, dateTime: currentTime))
        eventID += 1
    }
    
    private func requestAuthorization()
    {
        UNUserNotificationCenter.current().requestAuthorization(options: [.alert, .badge, .sound]) { granted, error in

        if granted == true && error == nil {
            self.scheduleNotifications()
            }
        }
    }
    
    private func scheduleNotifications(){
        
        for notification in notifications
        {
            let content = UNMutableNotificationContent()
            content.title = notification.title
            content.sound = .default
            
            let trigger = UNCalendarNotificationTrigger(dateMatching: notification.dateTime, repeats: false)

            let request = UNNotificationRequest(identifier: String(notification.id), content: content, trigger: trigger)

            UNUserNotificationCenter.current().add(request) { error in

                guard error == nil else { return }

                print("Notification scheduled! --- ID = \(notification.id)")
            }
        }
    }
    
    public func schedule()
    {
        UNUserNotificationCenter.current().getNotificationSettings { settings in

            switch settings.authorizationStatus {
            case .notDetermined:
                self.requestAuthorization()
            case .authorized, .provisional:
                self.scheduleNotifications()
            default:
                break // Do nothing
            }
        }
    }
}

public func ==(lhs: NSDate, rhs: NSDate) -> Bool {
    return lhs === rhs || lhs.compare(rhs as Date) == .orderedSame
}

public func <(lhs: NSDate, rhs: NSDate) -> Bool {
    return lhs.compare(rhs as Date) == .orderedAscending
}

extension NSDate: Comparable { }
