//
//  ThirdViewController.swift
//  Lesson02
//
//  Created by Rudd Taylor on 9/28/14.
//  Copyright (c) 2014 General Assembly. All rights reserved.
//

import UIKit

class ThirdViewController: UIViewController {
/*
    TODO six: Hook up the number input text field, button and text label to this class. When the button is pressed, a message should be printed to the label indicating whether the number is even.

*/
    @IBOutlet weak var numInput: UITextField!
    
    @IBOutlet weak var numLabel: UILabel!
    
    @IBOutlet weak var calBtn: UIButton!
    
    @IBAction func calIsEven(sender: AnyObject) {
        if let num = numInput.text.toInt() {
            numLabel.text = "\(num) is \(isEven(num))"
        } else {
            numLabel.text = "Please enter a number"
        }
    }
    
    func isEven(num : Int) -> String {
        if num % 2 == 0 {
            return "Even"
        } else {
            return "ODD"
        }
    }
}
