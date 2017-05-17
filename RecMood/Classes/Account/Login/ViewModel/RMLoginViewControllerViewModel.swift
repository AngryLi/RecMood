//
//  RMLoginViewControllerViewModel.swift
//  RecMood
//
//  Created by 李亚洲 on 2017/5/9.
//  Copyright © 2017年 李亚洲. All rights reserved.
//

import RxSwift


enum SimpleResult
{
    case ok(message:String)
    case error(errorMsg:String)
    case failure(reason:String)
}

class  RMLoginViewControllerViewModel: RMViewModel
{
    typealias ValidateResult = ValidateService.Result
    var title: String? = "登录"
    let phoneAvaliable : Observable<ValidateResult>
    let passwordAvaliable : Observable<ValidateResult>
    
    let loginAvaliable : Observable<Bool>
    
    
    let loginResult : Observable<SimpleResult>
    
    private(set) var loginSucess : Bool = false
    
    init(
        obserable:(
        phone:Observable<String>,
        password:Observable<String>
        ),
        loginTap:Observable<Void>
        )
    {
        self.phoneAvaliable = obserable.phone.flatMapLatest({
            ValidateService.validate(phoneNumber: $0).catchErrorJustReturn(ValidateResult.error(message: "校验出错")).subscribeOn(MainScheduler.instance)
        }).shareReplay(1)
        self.passwordAvaliable = obserable.password.flatMapLatest( {
            ValidateService.validate(password: $0).catchErrorJustReturn(ValidateResult.error(message: "校验出错")).subscribeOn(MainScheduler.instance)
        }).shareReplay(1)
        
        let input = Observable.combineLatest(obserable.phone, obserable.password)
        self.loginResult = loginTap.throttle(1, scheduler: MainScheduler.instance).withLatestFrom(input).flatMapLatest({
            LoginService.login(phone: $0.0, password: $0.1)
        }).flatMapLatest({_ in
            return Observable.just(SimpleResult.ok(message: "登录成功"))
        }).catchError({ (error) -> Observable<SimpleResult> in
            return Observable.just(SimpleResult.error(errorMsg: "登录失败"))
        }).subscribeOn(MainScheduler.instance).shareReplay(1)
        
        self.loginAvaliable = Observable.combineLatest(self.phoneAvaliable, self.passwordAvaliable, resultSelector: { (a1, a2) -> Bool in
            if case RMLoginViewControllerViewModel.ValidateResult.ok = a1,  case RMLoginViewControllerViewModel.ValidateResult.ok = a2 {
                return true
            }
            return false
        }).shareReplay(1)
    }
}
