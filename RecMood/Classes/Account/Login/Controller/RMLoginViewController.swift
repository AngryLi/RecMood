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
    @IBOutlet weak var tfPassword : UITextField!
    
//    @IBOutlet weak var btnGetVerifyCode : UIButton!
    @IBOutlet weak var btnLogin : UIButton!
    
    var viewModel: RMLoginViewControllerViewModel!
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        self.renderSubViews()
        
        self.bindViewModel()
    }

    override func didReceiveMemoryWarning()
    {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    private func renderSubViews()
    {
        
        self.btnLogin.rx.controlEvent(UIControlEvents.touchUpInside).subscribe { [unowned self](event) in
            switch event
            {
            case .next(_):
                self.showAlert(title: "🙄", message: "😋")
            default:
                break
            }
        }.addDisposableTo(self.disposeBag)
    }
    
    private func showAlert(title:String, message:String)
    {
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "cance", style: .cancel, handler: nil))
        alert.addAction(UIAlertAction(title: "done", style: .destructive, handler: nil))
        self.present(alert, animated: true, completion: nil)
    }
    
    override func bindViewModel()
    {
        super.bindViewModel()
        self.title = self.viewModel.title
        
        
        let phoneIsAvaliable = self.tfPhone.rx.text.orEmpty.map {[unowned self] (text) -> Bool in
            self.viewModel.isAvaliable(phone: text)
        }
        let passwordIsAvaliiable = self.tfPassword.rx.text.orEmpty.map {[unowned self] (text) -> Bool in
            self.viewModel.isAvaliable(password: text)
        }
        phoneIsAvaliable.bind(to: self.tfPassword.rx.isEnabled).disposed(by: self.disposeBag)
        Observable.combineLatest(phoneIsAvaliable, passwordIsAvaliiable, resultSelector: { (phone, code) -> Bool in
            return phone && code
        }).bind(to: self.btnLogin.rx.isEnabled).addDisposableTo(self.disposeBag)
    }
}
