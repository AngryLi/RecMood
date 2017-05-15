//
//  RMValidationService.swift
//  RecMood
//
//  Created by 李亚洲 on 2017/5/12.
//  Copyright © 2017年 李亚洲. All rights reserved.
//

import Foundation

import RxSwift



fileprivate extension Int
{
    func between(min:Int, max:Int) -> Bool
    {
        return self >= min && self <= max
    }
}

class ValidateService
{
    enum Result {
        case ok
        case error(message:String)
        case empty
    }
    
    static func validate(phoneNumber:String) -> Observable<Result>
    {
        if phoneNumber.characters.count == 11 {
            return Observable.just(Result.ok)
        }
        else {
            return Observable.just(Result.empty)
        }
    }
    
    static func validate(verifyCode:String) -> Observable<Result>
    {
        if verifyCode.characters.count.between(min: 4, max: 6) {
            return Observable.just(Result.ok)
        }
        else {
            return Observable.just(Result.empty)
        }
    }
    
    static func validate(password:String) -> Observable<Result>
    {
        if password.characters.count.between(min: 6, max: 16) {
            return Observable.just(Result.ok)
        } else {
            return Observable.just(.empty)
        }
    }
}

