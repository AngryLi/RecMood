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

    override func viewDidLoad() {
        super.viewDidLoad()
//        self.modalPresentationCapturesStatusBarAppearance = true
        self.renderSubView()
    }
//    override func viewWillAppear(_ animated: Bool) {
//        super.viewWillAppear(animated)
//        self.delegate?.leftMenuWillShow()
//    }
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        self.showSubViews()
    }
    private func showSubViews(completeHandler:((Bool)->Void)? = nil)
    {
        self.delegate?.leftMenuWillShow()
        UIView.animate(withDuration: self.duration, animations: {
            self.view.backgroundColor = UIColor.init(white: 0, alpha: 0.3)
            self.initTablePositionShowed()
        }, completion: completeHandler)
    }
    
    private func hiddenSubviews(completeHandler:((Bool)->Void)? = nil)
    {
        self.delegate?.leftMenuWillHidden()
        UIView.animate(withDuration: self.duration, animations: {
            self.view.backgroundColor = UIColor.clear
            self.initTablePositionHidden()
        }, completion: completeHandler)
    }
    
    private func initTablePositionHidden()
    {
        self.tableView.transform = CGAffineTransform.init(translationX: -self.tableView.bounds.size.width, y: 0)
    }
    private func initTablePositionShowed()
    {
        self.tableView.transform = CGAffineTransform.identity
    }
    
    private func renderSubView()
    {
//        self.transitioningDelegate = self
        self.view.backgroundColor = UIColor.clear
        let tap = UITapGestureRecognizer(target: self, action: #selector(handle_tapView(sender:)))
        self.view.addGestureRecognizer(tap)
        
        self.initTablePositionHidden()
    }
    
    @objc private func handle_tapView(sender:UITapGestureRecognizer)
    {
        if !self.tableView.frame.contains(sender.location(in: sender.view)) {
            self.hiddenSubviews(completeHandler: { (finished) in
                self.dismiss(animated: false, completion: nil)
            })
        }
    }
    
//    override var preferredStatusBarStyle: UIStatusBarStyle {
//        return .lightContent
//    }
    
//    override var prefersStatusBarHidden: Bool {
//        return true
//    }

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
