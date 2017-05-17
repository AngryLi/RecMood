//
//  RMMoodDetailViewController.swift
//  RecMood
//
//  Created by 李亚洲 on 2017/5/16.
//  Copyright © 2017年 李亚洲. All rights reserved.
//

import UIKit

class RMMoodDetailViewController: UIViewController, RMLeftMenuControllerDelegate
{
    var hidden = false
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        self.navigationItem.rightBarButtonItem = UIBarButtonItem(title: "show", style: .done, target: self, action: #selector(action_show))
        
    }
    
    @objc private func action_show()
    {
        self.performSegue(withIdentifier: "showLeftMenu", sender: nil)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override var prefersStatusBarHidden: Bool {
        return self.hidden
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let vc = segue.destination as? RMLeftMenuController {
            vc.delegate = self
        }
    }
    
    func leftMenuWillShow() {
        self.hidden = true
        self.setNeedsStatusBarAppearanceUpdate()
        self.navigationController?.setNavigationBarHidden(true, animated: true)
    }
    
    func leftMenuWillHidden() {
        self.hidden = false
        self.setNeedsStatusBarAppearanceUpdate()
        self.navigationController?.setNavigationBarHidden(false, animated: true)
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
