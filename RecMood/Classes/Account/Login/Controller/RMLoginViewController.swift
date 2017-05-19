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

class RMLoginViewController : RMBaseViewController, RMBindViewModelProperty
{
    @IBOutlet weak var tfPhone : UITextField!
    @IBOutlet weak var tfPassword : UITextField!
    
//    @IBOutlet weak var btnGetVerifyCode : UIButton!
    @IBOutlet weak var btnLogin : UIButton!

    
    lazy var viewModel: RMLoginViewControllerViewModel! = {
        let observable = (self.tfPhone.rx.text.orEmpty.asObservable(), self.tfPassword.rx.text.orEmpty.asObservable())
        let tap = self.btnLogin.rx.tap.asObservable()
        return RMLoginViewControllerViewModel(obserable: observable, loginTap: tap)
    }()
    
    
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
//        self.btnLogin.rx.tap.subscribe { [weak self](event) in
//            switch event
//            {
//            case .next(_):
//                self?.showAlert(title: "🙄", message: "😋")
//            default:
//                break
//            }
//        }.addDisposableTo(self.disposeBag)
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
        
        self.viewModel.loginAvaliable.bind(to: self.btnLogin.rx.isEnabled).addDisposableTo(self.disposeBag)
        
        
        self.viewModel.loginAvaliable.map { return $0 ? UIColor.blue : UIColor.lightGray }.subscribe { (event) in
            if case let Event.next(color) = event {
                self.btnLogin.backgroundColor = color
            }
        }.addDisposableTo(self.disposeBag)
        
        self.viewModel.loginResult.subscribe { (event) in
            switch event
            {
            case .next(let element):
                switch element {
                case .ok(message: let message):
                    print(message)
                    break
                default:
                    break
                }
                break
                
            default:
                break
            }
        }.addDisposableTo(self.disposeBag)
//        let phoneIsAvaliable = self.tfPhone.rx.text.orEmpty.map {[unowned self] (text) -> Bool in
//            self.viewModel.isAvaliable(phone: text)
//        }
//        let passwordIsAvaliiable = self.tfPassword.rx.text.orEmpty.map {[unowned self] (text) -> Bool in
//            self.viewModel.isAvaliable(password: text)
//        }
//        phoneIsAvaliable.bind(to: self.tfPassword.rx.isEnabled).disposed(by: self.disposeBag)
//        Observable.combineLatest(phoneIsAvaliable, passwordIsAvaliiable, resultSelector: { (phone, code) -> Bool in
//            return phone && code
//        }).bind(to: self.btnLogin.rx.isEnabled).addDisposableTo(self.disposeBag)
    }
}
