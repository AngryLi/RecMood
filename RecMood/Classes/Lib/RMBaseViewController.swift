//
//  RMBaseViewController.swift
//  RecMood
//
//  Created by 李亚洲 on 2017/5/9.
//  Copyright © 2017年 李亚洲. All rights reserved.
//

import UIKit

import RxSwift
import RxCocoa

class RMBaseViewController : UIViewController, RMBindViewModelMethod
{
    func bindViewModel() {
        guard self.isViewLoaded else {
            return
        }
    }
    
    private(set) lazy var disposeBag = DisposeBag()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
}


