//
//  RMUserAccountManager.swift
//  RecMood
//
//  Created by 李亚洲 on 2017/5/8.
//  Copyright © 2017年 李亚洲. All rights reserved.
//

import Foundation

class RMUserAccountManager
{
    static let `default` = RMUserAccountManager()
    
    private(set) var userId : String?
    private(set) var token : String?
    
    private init()
    {
        self.readUserInfo()
    }
    
    func isLogin() -> Bool
    {
        if self.userId != nil && self.token != nil {
            return true
        } else {
            return false
        }
    }
    
    private func readUserInfo()
    {
        if let userId = UserDefaults.standard.string(forKey: "RM_UserId_Identifier")
        {
            self.userId = userId
        }
        if let token = UserDefaults.standard.string(forKey: "RM_Token_Identifier")
        {
            self.token = token
        }
    }
}
