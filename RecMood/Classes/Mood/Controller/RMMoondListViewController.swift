//
//  RMMoondListViewController.swift
//  RecMood
//
//  Created by 李亚洲 on 2017/5/1.
//  Copyright © 2017年 李亚洲. All rights reserved.
//

import UIKit

class RMMoondListViewController: UITableViewController, RMLeftMenuControllerDelegate
{
    lazy var viewModel = RMMoodListViewControllerViewModel()
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
        self.tableView.estimatedRowHeight = 50;
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    //MARK: event
    @IBAction func action_showLeftMenu()
    {
        
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let identifier = segue.identifier else {
            return
        }
        if identifier == "showLeftMenu" {
            if let vc = segue.destination as? RMLeftMenuController {
                vc.delegate = self
            }
        }
    }
    
    func leftMenuWillShow() {
        self.navigationController?.setNavigationBarHidden(true, animated: true)
    }
    func leftMenuWillHidden() {
        self.navigationController?.setNavigationBarHidden(false, animated: true)
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 10;
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell
    {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! RMMoondListCell
        
        cell.bindModel(moodItem: self.viewModel.itemFor(index: indexPath))
        
        return cell
    }
}
