//
//  ModalViewController.swift
//  Lesson03
//
//  Created by Angel S. Moreno on 1/16/15.
//  Copyright (c) 2015 General Assembly. All rights reserved.
//

import UIKit

class ModalViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    @IBAction func dimissModal(sender: AnyObject) {
        dismissViewControllerAnimated(true, completion: nil)
    }
    
}
