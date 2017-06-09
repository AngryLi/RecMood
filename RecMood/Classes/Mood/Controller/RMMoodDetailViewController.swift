//
//  RMMoodDetailViewController.swift
//  RecMood
//
//  Created by 李亚洲 on 2017/5/16.
//  Copyright © 2017年 李亚洲. All rights reserved.
//

import UIKit

class RMMoodDetailViewController: UIViewController
{
    var hidden = false
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        self.navigationItem.rightBarButtonItem = UIBarButtonItem(title: "show", style: .done, target: self, action: #selector(action_show))
    }
    
    @objc private func action_show()
    {
        
    }
    
    override var prefersStatusBarHidden: Bool {
        return true
    }
}
