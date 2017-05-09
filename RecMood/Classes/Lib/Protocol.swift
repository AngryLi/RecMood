//
//  Protocol.swift
//  RecMood
//
//  Created by 李亚洲 on 2017/5/9.
//  Copyright © 2017年 李亚洲. All rights reserved.
//

protocol RMBindViewModelProperty
{
    associatedtype T : RMViewModel
    var viewModel:T? { get set }
}

protocol RMBindViewModelMethod
{
    func bindViewModel()
}

protocol RMBindViewModelable : RMBindViewModelProperty, RMBindViewModelMethod
{
    
}
/*
extension RMBindViewModelMethod where Self : UIViewController
{
    func bindViewModel()
    {
        guard self.isViewLoaded else
        {
            return
        }
    }
}
 */
