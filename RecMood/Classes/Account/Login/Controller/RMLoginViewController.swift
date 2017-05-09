//
//  RMLoginViewController.swift
//  RecMood
//
//  Created by 李亚洲 on 2017/5/5.
//  Copyright © 2017年 李亚洲. All rights reserved.
//

import UIKit

import RxSwift
import RxCocoa
import Kingfisher

class RMLoginViewController : RMBaseViewController, RMBindViewModelable
{
    @IBOutlet weak var tfPhone : UITextField!
    @IBOutlet weak var tfCode : UITextField!
    
    @IBOutlet weak var btnGetVerifyCode : UIButton!
    @IBOutlet weak var btnLogin : UIButton!

    var viewModel: RMLoginViewControllerViewModel?
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        self.bindViewModel()
        
        self.btnLogin.kf.setImage(with: URL.init(string: ""), for: .normal)
    }

    override func didReceiveMemoryWarning()
    {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func bindViewModel()
    {
        super.bindViewModel()
        self.title = self.viewModel?.title
    }
    
}
