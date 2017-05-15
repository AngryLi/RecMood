//
//  AppDelegate.swift
//  RecMood
//
//  Created by 李亚洲 on 2017/5/1.
//  Copyright © 2017年 李亚洲. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?


    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        
        
        self.window = UIWindow.init(frame: UIScreen.main.bounds)
        self.window?.makeKeyAndVisible()
        
        if let _ = launchOptions?[.remoteNotification]
        {
            
        }
        
        if RMUserAccountManager.default.isLogin()
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

