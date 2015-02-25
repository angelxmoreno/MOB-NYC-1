//
//  ThirdViewController.swift
//  Lesson07
//
//  Created by Rudd Taylor on 9/30/14.
//  Copyright (c) 2014 General Assembly. All rights reserved.
//

import UIKit

class ThirdViewController: UIViewController {
    var getPath: NSURL {
        get {
            let url = NSFileManager.defaultManager().URLsForDirectory(.DocumentDirectory, inDomains: .UserDomainMask)[0] as NSURL
            
            let fileUrl = url.URLByAppendingPathComponent("ToDo3Text")
            return fileUrl
        }
    }

    @IBOutlet weak var thirdViewControllerView: UITextView!
    
    override func viewWillDisappear(animated: Bool) {
        let itemsToStore: NSArray = NSArray(array: [thirdViewControllerView.text!])
        if itemsToStore.writeToURL(getPath, atomically: true) {
            println("I saved")
        } else {
            println("I failed")
        }

    }
}
