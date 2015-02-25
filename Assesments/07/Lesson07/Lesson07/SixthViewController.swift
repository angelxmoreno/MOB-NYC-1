
//
//  SixthViewController.swift
//  Lesson07
//
//  Created by Rudd Taylor on 9/30/14.
//  Copyright (c) 2014 General Assembly. All rights reserved.
//

import UIKit

class SixthViewController: UIViewController {
    
    @IBOutlet weak var sixthViewControllerView: UITextView!
    var getPath: NSURL {
        get {
            let url = NSFileManager.defaultManager().URLsForDirectory(.DocumentDirectory, inDomains: .UserDomainMask)[0] as NSURL
            
            let fileUrl = url.URLByAppendingPathComponent("ToDo5Text")
            return fileUrl
        }
    }
    
    var toDo5TextAsArray: NSArray {
        get{
            var nsarrayToReturn: NSArray = []
            if let storedItems = NSArray(contentsOfURL: getPath) {
                let firstItem = storedItems[0] as NSArray
                return firstItem
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

    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
        appendString()
    }
    
    func appendString(){
        let toDo5TextAsString = arrayToString(toDo5TextAsArray)
        self.sixthViewControllerView.text = "\(sixthViewControllerView.text!)\n\n\n" + toDo5TextAsString
    }
    
    func arrayToString(array2join: NSArray) -> String {
        var stringToReturn = ""
        for elmInArray in array2join {
            if let stringInArray = elmInArray as? String {
                stringToReturn = stringToReturn + " " + stringInArray
            }
        }
        return stringToReturn
    }
}
