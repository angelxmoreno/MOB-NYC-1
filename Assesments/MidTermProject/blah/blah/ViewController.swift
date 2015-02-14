//
//  ViewController.swift
//  blah
//
//  Created by Angel S. Moreno on 2/11/15.
//  Copyright (c) 2015 Angel S. Moreno. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var dBtn: UIButton!
    @IBOutlet weak var dTextField: UITextField!
    @IBOutlet weak var dLabel: UILabel!
    
    var calbot = CalculatorClass()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        dLabel.text = calbot.display
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func didAdd(sender: AnyObject) {
        //take text string
        var valString = self.dTextField.text

        //convert to int
        var valInt: Int = NSString(string: valString).integerValue

        //call appendNumber
        self.calbot.appendNumber(valInt)
        
        //call appendOperation
        self.calbot.appendOperation(CalculatorOperation.Add)
        
        //update display
        
        self.dLabel.text = self.calbot.display
    }

}

