//
//  BouncePresentAnimation.swift
//  RecMood
//
//  Created by 李亚洲 on 2017/5/16.
//  Copyright © 2017年 李亚洲. All rights reserved.
//

import UIKit

class BouncePresentAnimation : NSObject, UIViewControllerAnimatedTransitioning
{
    
    func transitionDuration(using transitionContext: UIViewControllerContextTransitioning?) -> TimeInterval {
        return 0.3
    }
    func animateTransition(using transitionContext: UIViewControllerContextTransitioning)
    {
        // 1. Get controllers from transition context
        guard let toVC = transitionContext.viewController(forKey: .to) else {
            return
        }
        
        // 2. Set init frame for toVC
        let screenBounds = UIScreen.main.bounds
        let finalFrame = transitionContext.finalFrame(for: toVC)
        toVC.view.frame = finalFrame.offsetBy(dx: -screenBounds.size.width, dy: 0)
        
        // 3. Add toVC's view to containerView
        let containerView = transitionContext.containerView
        containerView.addSubview(toVC.view)
        
        // 4. Do animate now
        let duration = self.transitionDuration(using: transitionContext)
        UIView.animate(withDuration: duration, animations: { 
            toVC.view.frame = finalFrame
        }) { (finished) in
            // 5. Tell context that we completed.
            transitionContext.completeTransition(finished)
        }
    }
}
