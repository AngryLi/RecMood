//
//  RMStoryBoardLoad.swift
//  RecMood
//
//  Created by 李亚洲 on 2017/5/8.
//  Copyright © 2017年 李亚洲. All rights reserved.
//

import UIKit

class RMStoryBoardLoader
{
    
    private enum StoryBoardName : String
    {
        case main = "Main"
        case account = "Account"
        case mood = "Mood"
        case personalCenter = "PersonalCenter"
    }
    
    private enum ControlelrIdentifier : String
    {
        case loginViewController = "RMLoginViewController"
        case loginViewControllerNav = "RMLoginViewController_Nav"
        case mainViewController = "RMMainViewController"
    }
    
    class func loginViewController() -> UIViewController
    {
        return self.load(storyName: .account, controllerIdentifier: .loginViewController)
    }
    
    class func loginViewControllerNav() -> UINavigationController {
        return self.load(storyName: .account, controllerIdentifier: .loginViewControllerNav) as! UINavigationController
    }
    
    class func mainViewController() -> UITabBarController
    {
        return self.load(storyName: .account, controllerIdentifier: .mainViewController) as! UITabBarController
    }
    
    // MARK: private
    
    private class func load(storyName:StoryBoardName, controllerIdentifier:ControlelrIdentifier) -> UIViewController
    {
        return UIStoryboard(name: storyName.rawValue, bundle: Bundle.main).instantiateViewController(withIdentifier: controllerIdentifier.rawValue)
    }
}


