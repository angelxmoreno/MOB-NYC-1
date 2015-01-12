//
//  FourthViewController.swift
//  Lesson02
//
//  Created by Rudd Taylor on 9/28/14.
//  Copyright (c) 2014 General Assembly. All rights reserved.
//

import UIKit

class FourthViewController: UIViewController {
/*
    TODO seven: Hook up the text input box, label and and a ‘calculate’ button. Create a ‘fibonacci adder’ class with a method ‘fibonacciNumberAtIndex' which takes indexOfFibonacciNumber (an integer).  When the button is pressed, create an instance of that class, call the method, and print out the appropriate fibonacci number of an inputted integer.
    The first fibonacci number is 0, the second is 1, the third is 1, the fourth is two, the fifth is 3, the sixth is 5, etc. The Xth fibonacci number is the sum of the X-1th fibonacci number and the X-2th fibonacci number.
*/
    
    @IBOutlet weak var numInput: UITextField!
    @IBOutlet weak var numLabel: UILabel!
    
    @IBOutlet weak var calBtn: UIButton!
    
    @IBAction func calIndex(sender: AnyObject) {
        if let index = numInput.text.toInt() {
            var foo = fibonacciAdder()
            numLabel.text = "\(foo.fibonacciNumberAtIndex(index))"
        }
    }
    
}

class fibonacciAdder {
    func fibonacciNumberAtIndex(index: Int) -> Int {
        
        return index
    }
}