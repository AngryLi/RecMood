//
//  RMLoginService.swift
//  RecMood
//
//  Created by 李亚洲 on 2017/5/12.
//  Copyright © 2017年 李亚洲. All rights reserved.
//

import Foundation

import RxSwift

class LoginService
{
    enum Result
    {
        case ok(message:String)
        case error(errMsg:String)
        case failure(reason:String)
    }
    
    static func login( phone:String, password:String ) -> Observable<Result>
    {
        return Observable.just(Result.ok(message: "login sucess"))
    }
}


