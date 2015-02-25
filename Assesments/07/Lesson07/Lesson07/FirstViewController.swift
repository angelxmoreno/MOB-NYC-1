//
//  FirstViewController.swift
//  Lesson07
//
//  Created by Rudd Taylor on 9/30/14.
//  Copyright (c) 2014 General Assembly. All rights reserved.
//

import UIKit

class FirstViewController: UIViewController {
    
    let defaults = NSUserDefaults.standardUserDefaults()
    
    @IBOutlet weak var firstViewTextView: UITextView!
    override func viewDidLoad() {
        super.viewDidLoad()
        appendTestText()
    }
    
    func appendTestText(){
        let testNumber = defaults.stringForKey("test_number")!
        let testString = defaults.stringForKey("test_string")!
        let textToAppend = "\n\n\n The Test String is:\"\(testString)\". \n\n The Test Number is:\"\(testNumber)\""
        
        firstViewTextView.text! = firstViewTextView.text! + textToAppend

    }
}