//
//  AppDelegate.swift
//  RecMood
//
//  Created by 李亚洲 on 2017/5/1.
//  Copyright © 2017年 李亚洲. All rights reserved.
//

import UIKit

import UserNotifications

private let usingNotification = false

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate, UNUserNotificationCenterDelegate
{
    var window: UIWindow?
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        
        let center = UNUserNotificationCenter.current()
        center.getNotificationSettings { (setting:UNNotificationSettings) in
            switch setting.authorizationStatus
            {
            case .notDetermined:
                guard usingNotification else {
                    break
                }
                center.requestAuthorization(options: [.alert, .badge, .sound, .carPlay]) { (granted, error) in
                    if granted
                    {
                        
                    }
                    else if let _ = error
                    {
                        
                    }
                }
            default:
                break
            }
        }
        center.delegate = self
        
        self.window = UIWindow.init(frame: UIScreen.main.bounds)
        self.window?.makeKeyAndVisible()
        
        if let _ = launchOptions?[.remoteNotification]
        {
            
        }
        
        if !RMUserAccountManager.default.isLogin()
        {
            self.window?.rootViewController = RMStoryBoardLoader.mainViewController()
        }
        else
        {
            self.window?.rootViewController = RMStoryBoardLoader.loginViewControllerNav()
        }
        
        return true
    }
    
    func application(_ application: UIApplication, didReceiveRemoteNotification userInfo: [AnyHashable : Any], fetchCompletionHandler completionHandler: @escaping (UIBackgroundFetchResult) -> Void) {
        completionHandler(.noData);
    }
}

