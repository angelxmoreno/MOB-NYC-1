//
//  SecondViewController.swift
//  Lesson07
//
//  Created by Rudd Taylor on 9/30/14.
//  Copyright (c) 2014 General Assembly. All rights reserved.
//

import UIKit

class SecondViewController: UIViewController {
    
    @IBOutlet weak var secondViewTextView: UITextView!
    var settings_slider_val: Float {
        get{
            let defaults = NSUserDefaults.standardUserDefaults()
                defaults.synchronize()
            
            if let sliderVal = defaults.objectForKey("settings_slider") as? Float {
                return sliderVal
            } else {
                return Float(0)
            }
        }
        set{}
    }
    
    var settings_string_val: String {
        get{
            let defaults = NSUserDefaults.standardUserDefaults()
            defaults.synchronize()
            
            if let stringVal = defaults.stringForKey("settings_name") {
                return stringVal
            } else {
                return String()
            }
        }
        set{}
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
        appendSettingsText()
    }
    
    func appendSettingsText(){
        let textToAppend = "\n\n\n The Settings String is:\"\(settings_string_val)\". \n\n The Settings Slider is:\"\(settings_slider_val)\""
        
        secondViewTextView.text! = secondViewTextView.text! + textToAppend
        
    }
}
