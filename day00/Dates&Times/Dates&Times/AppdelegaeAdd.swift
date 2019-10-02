//
//  AppdelegaeAdd.swift
//  Dates&Times
//
//  Created by jeffrey chiang on 10/1/19.
//  Copyright © 2019 jeffrey chiang. All rights reserved.
//

import Foundation
import UserNotifications
import UIKit

@UIApplicationMain

class AppDelegateAdd: UIResponder, UIApplicationDelegate
{
    var window: UIWindow?
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool
    {
        UNUserNotificationCenter.current().delegate = self as? UNUserNotificationCenterDelegate

        return true
    }
}
