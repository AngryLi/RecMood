//
//  RMLoginViewController.swift
//  RecMood
//
//  Created by 李亚洲 on 2017/5/5.
//  Copyright © 2017年 李亚洲. All rights reserved.
//

import UIKit

import ReactiveCocoa
import ReactiveSwift

class RMLoginViewController: UIViewController {
    
    @IBOutlet weak var tfPhone : UITextField!
    @IBOutlet weak var tfCode : UITextField!
    
    @IBOutlet weak var btnGetVerifyCode : UIButton!
    @IBOutlet weak var btnLogin : UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        self.btnGetVerifyCode.reactive.isEnabled <~ self.tfPhone.reactive.continuousTextValues.map { (text) -> Bool in
            return text?.characters.count == 11
        }
        self.btnGetVerifyCode.reactive
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
