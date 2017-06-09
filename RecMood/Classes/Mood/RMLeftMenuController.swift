//
//  RMLeftMenuController.swift
//  RecMood
//
//  Created by 李亚洲 on 2017/5/16.
//  Copyright © 2017年 李亚洲. All rights reserved.
//

import UIKit

protocol RMLeftMenuControllerDelegate {
    func leftMenuWillShow()
    func leftMenuWillHidden()
}

class RMLeftMenuController: UIViewController
{
    let duration : TimeInterval = 0.3
    
    var delegate:RMLeftMenuControllerDelegate?
    
    @IBOutlet var tableView:UITableView!

    override func viewDidLoad()
    {
        super.viewDidLoad()
    }
    
//    override var preferredStatusBarStyle: UIStatusBarStyle {
//        return .lightContent
//    }
    
    override var prefersStatusBarHidden: Bool {
        return true
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table view data source

    func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 0
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return 0
    }
}
