//
//  FourthViewController.swift
//  Lesson07
//
//  Created by Rudd Taylor on 9/30/14.
//  Copyright (c) 2014 General Assembly. All rights reserved.
//

import UIKit

class FourthViewController: UIViewController {
    var getPath: NSURL {
        get {
            let url = NSFileManager.defaultManager().URLsForDirectory(.DocumentDirectory, inDomains: .UserDomainMask)[0] as NSURL
            
            let fileUrl = url.URLByAppendingPathComponent("ToDo3Text")
            return fileUrl
        }
    }
    
    var previousText: String {
        get{
            if let storedItems = NSArray(contentsOfURL: getPath) {
                if let singleItem = storedItems.firstObject as? String{
                    return singleItem
                }
            }
            return String()
        }
    }
    
    @IBOutlet weak var fourthViewControllerView: UITextView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
        appendPrevViewControllerText()
    }
    
    func appendPrevViewControllerText(){
        let textToAppend = "\n\n\n \"\(previousText)\""
        fourthViewControllerView.text! = fourthViewControllerView.text! + textToAppend
        
    }
}
