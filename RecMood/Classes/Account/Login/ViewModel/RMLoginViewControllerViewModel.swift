//
//  RMLoginViewControllerViewModel.swift
//  RecMood
//
//  Created by 李亚洲 on 2017/5/9.
//  Copyright © 2017年 李亚洲. All rights reserved.
//

struct  RMLoginViewControllerViewModel: RMViewModel
{
    var title: String? = "登录"
    
    func isAvaliable(password:String?) -> Bool {
        guard let pwd = password else {
            return false
        }
        return pwd.characters.count >= 6
    }
    
    func isAvaliable(phone:String?) -> Bool {
        guard let phoneNumber = phone else {
            return false
        }
        return phoneNumber.characters.count == 11
    }
}
