//
//  RMLoginService.swift
//  RecMood
//
//  Created by 李亚洲 on 2017/5/12.
//  Copyright © 2017年 李亚洲. All rights reserved.
//

import Foundation

import RxSwift
import Alamofire

typealias ResponseResult = Dictionary<String, Any>
struct ResponseError : Error
{
    let statusCode:Int
    let errorMsg:String
}

struct ResponseFailure : Error {
    let statusCode:Int
    let reason:Int
}

class LoginService
{
    static func login( phone:String, password:String ) -> Observable<ResponseResult>
    {
        return Observable.create { (observer) -> BooleanDisposable in
            let params : Parameters = [:]
            request("login", method: .post, parameters: params, encoding: JSONEncoding.default, headers: nil).responseJSON { (response) in
                if response.result.isSuccess
                {
                    if let response = response.result.value as? Dictionary<String, Dictionary<String, Any>>
                    {
                        observer.onNext(response["content"] ?? [:])
                        observer.onCompleted()
                    }
                    else
                    {
                        
                    }
                }
                else
                {
                    if let error = response.error
                    {
                        print(error)
                    }
                }
            }
            return BooleanDisposable()
        }
    }
}


