//
//  ViewController.swift
//  taiwan8swift
//
//  Created by ALEX on 2015/2/11.
//  Copyright (c) 2015年 miiitech. All rights reserved.
//

import UIKit

class ViewController: FinalRaisedCenterTabController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        self.centerButton = UIButton()
        self.centerButton.setImage(UIImage(named: "write"), forState: UIControlState.Normal)
        self.centerButton.addTarget(self, action:Selector("showModal"), forControlEvents:UIControlEvents.TouchUpInside)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    func showModal(){
        let storyboard: UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
        let controller:UIViewController = storyboard.instantiateViewControllerWithIdentifier("ModalController") as UIViewController
        self.presentViewController(controller, animated: true, completion: nil)
    }
}

