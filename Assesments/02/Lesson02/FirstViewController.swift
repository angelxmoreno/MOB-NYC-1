//
//  FirstViewController.swift
//  Lesson02
//
//  Created by Rudd Taylor on 9/28/14.
//  Copyright (c) 2014 General Assembly. All rights reserved.
//

import UIKit

class FirstViewController: UIViewController {
    @IBOutlet weak var mainLabel: UILabel!
    
    @IBOutlet weak var mainBtn: UIButton!
    
    @IBOutlet weak var nameInput: UITextField!
    @IBOutlet weak var ageInput: UITextField!
    /*
    TODO one: hook up a button in interface builder to a new function (to be written) in this class. Also hook up the label to this class. When the button is clicked, the function to be written must make a label say ‘hello world!’
    
    TODO two: Connect the ‘name’ and ‘age’ text boxes to this class. Hook up the button to a NEW function (in addition to the function previously defined). That function must look at the string entered in the text box and print out “Hello {name}, you are {age} years old!”
    TODO three: Hook up the button to a NEW function (in addition to the two above). Print “You can drink” below the above text if the user is above 21. If they are above 18, print “you can vote”. If they are above 16, print “You can drive”
    TODO four: Hook up the button to a NEW function (in additino to the three above). Print “you can drive” if the user is above 16 but below 18. It should print “You can drive and vote” if the user is above 18 but below 21. If the user is above 21, it should print “you can drive, vote and drink (but not at the same time!”.
    */
    
    @IBAction func btnClick(sender: AnyObject) {
        sayHello2()
        powerLevel2()
    }
    
    func sayHello1(){
        var text = "hello world"
        mainLabel.text = text
    }
    
    func sayHello2(){
        var text = "hello world"
        
        let userName = nameInput.text
        let userAge = ageInput.text
        if(userName != "" && userAge != ""){
            text = "Hello \(userName), you are \(userAge) years old!"
        } else if(userName == "" && userAge != ""){
            text = "Hello world, you are \(userAge) years old!"
        } else if(userName != "" && userAge == ""){
            text = "Hello \(userName)!"
        }
        mainLabel.text = text
    }
    
    func powerLevel1(){
        var text = mainLabel.text! + " "
        
        let userAge = ageInput.text.toInt()
        
        if(userAge > 21){
            text += "You can drink. "
        }
        
        if(userAge > 18){
            text += "You can vote. "
        }
        
        if(userAge > 16){
            text += "You can drive. "
        }

        mainLabel.text = text
    }
    
    func powerLevel2(){
        var text = mainLabel.text! + " "
        
        let userAge = ageInput.text.toInt()
        
        if(userAge > 21){
            text += "You can drink, drive and vote but not at the same time! "
        } else if(userAge > 18){
            text += "You can drive and vote. "
        } else if(userAge > 16){
            text += "You can drive. "
        }
        mainLabel.text = text
    }
    
}
