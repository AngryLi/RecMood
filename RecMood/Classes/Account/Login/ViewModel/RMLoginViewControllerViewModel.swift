//
//  RMLoginViewControllerViewModel.swift
//  RecMood
//
//  Created by 李亚洲 on 2017/5/9.
//  Copyright © 2017年 李亚洲. All rights reserved.
//

import RxSwift

class  RMLoginViewControllerViewModel: RMViewModel
{
    typealias ValidateResult = ValidateService.Result
    typealias LoginResult = LoginService.Result
    var title: String? = "登录"
    let phoneAvaliable : Observable<ValidateResult>
    let passwordAvaliable : Observable<ValidateResult>
    
    let loginResult : Observable<LoginResult>
    
    
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
        })
    }
}
