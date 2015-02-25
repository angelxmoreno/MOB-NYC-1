//
//  FifthViewController.swift
//  Lesson07
//
//  Created by Rudd Taylor on 9/30/14.
//  Copyright (c) 2014 General Assembly. All rights reserved.
//

import UIKit

class FifthViewController: UIViewController {

    @IBOutlet weak var fifthViewControllerView: UITextView!
    var getPath: NSURL {
        get {
            let url = NSFileManager.defaultManager().URLsForDirectory(.DocumentDirectory, inDomains: .UserDomainMask)[0] as NSURL
            
            let fileUrl = url.URLByAppendingPathComponent("ToDo5Text")
            return fileUrl
        }
    }
    
    var toDo5TextAsArray: NSArray {
        get{
            if let storedItems = NSArray(contentsOfURL: getPath) {
                return storedItems
            }
            return NSArray()
        }
        
        set {
            let itemsToStore: NSArray = NSArray(array: [newValue])
            if itemsToStore.writeToURL(getPath, atomically: true) {
                println("I saved")
            } else {
                println("I failed")
            }
        }
    }
    
    override func viewWillDisappear(animated: Bool) {
        self.toDo5TextAsArray = fifthViewControllerView.text.componentsSeparatedByString(" ")
    }

    
}
