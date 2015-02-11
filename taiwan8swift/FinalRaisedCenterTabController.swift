//
//  FinalRaisedCenterTabController.swift
//  taiwan8swift
//
//  Created by ALEX on 2015/2/11.
//  Copyright (c) 2015年 miiitech. All rights reserved.
//

import Foundation
import UIKit

class FinalRaisedCenterTabController: UITabBarController {

//    required init(coder aDecoder: NSCoder) {
//        fatalError("init(coder:) has not been implemented")
//    }
    
    var centerButton: UIButton!
    
    override func viewDidLoad() {
        self.tabBar.addObserver(self, forKeyPath: "hide", options: NSKeyValueObservingOptions.New, context: nil)
    }
    
    override func viewWillLayoutSubviews() {
        super.viewWillLayoutSubviews()
        if self.centerButton != nil {
            if self.centerButton.superview == nil{
                self.view.addSubview(self.centerButton)
            }
            
            var image: UIImage!
            image = self.centerButton.imageForState(UIControlState.Normal)
            self.centerButton.frame = CGRectMake(0.0, 0.0, image.size.width, image.size.height)
            
            let heightDifference:CGFloat = image.size.height - self.tabBar.frame.size.height
            
            let center:CGPoint = self.tabBar.center
            
            if heightDifference > 0 {
                center.y == center.y - heightDifference/2.0
            }
            
            self.centerButton.center = center
            self.view.bringSubviewToFront(self.centerButton)
        }
    }
    
    
    override func observeValueForKeyPath(keyPath: String, ofObject object: AnyObject, change: [NSObject : AnyObject], context: UnsafeMutablePointer<Void>) {
        if keyPath == "hidden" {
            self.centerButton.hidden = change["new"]!.boolValue!
        }
    }
    
//    override func dealloc() {
//        self.tabBar.removeObserver(self, forKeyPath: "hidden")
//    }
}