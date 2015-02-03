//
//  ViewController.swift
//  Assingment 9
//
//  Created by Angel S. Moreno on 2/2/15.
//  Copyright (c) 2015 Angel S. Moreno. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    let userLabel = UILabel(frame: CGRect(x: 60, y: 30, width: 60, height: 30))
    let userText = UITextField(frame: CGRect(x: 200, y: 30, width: 120, height: 30))
    
    let passwordLabel = UILabel(frame: CGRect(x: 60, y: 120, width: 60, height: 30))
    let passwordText = UITextField(frame: CGRect(x: 200, y: 120, width: 120, height: 30))
    
    let loginBtn = UIButton(frame: CGRect(x: 60, y: 210, width: 260, height: 30))
    let cointainer = UIView(frame: CGRect(x: 5, y: 5, width: 365, height: 657))
    let succesView = UIView(frame: CGRect(x: 157.5, y: 0, width: 260, height: 160))
    let dismissBtn = UIButton(frame: CGRect(x: 0, y: 00, width: 0, height: 0))
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.

        loginBtn.addTarget(
            self,
            action: "didClick",
            forControlEvents: UIControlEvents.TouchUpInside
        )
        
        userLabel.text = "Username"
        userText.placeholder = "Your username"
        
        passwordLabel.text = "Password"
        passwordText.placeholder = "Your Password"
        
        loginBtn.setTitle("Log In", forState: UIControlState())
        loginBtn.backgroundColor = UIColor.blueColor()
        
        cointainer.backgroundColor = UIColor.grayColor()
        loginBtn.center.x = cointainer.center.x

        cointainer.addSubview(userLabel)
        cointainer.addSubview(userText)
        cointainer.addSubview(passwordLabel)
        cointainer.addSubview(passwordText)
        cointainer.addSubview(loginBtn)
        
        succesView.center = cointainer.center
        succesView.backgroundColor = UIColor.orangeColor()
        succesView.alpha = 0
        
        dismissBtn.backgroundColor = UIColor.blueColor()
        dismissBtn.setTitle("Dismiss", forState: UIControlState.Normal)
        dismissBtn.addTarget(self, action: "dismissSuccess", forControlEvents: UIControlEvents.TouchUpInside)

//        dismissBtn.frame.width = succesView.frame.width.hashValue * 0.8
        
        dismissBtn.center = succesView.center
        
        succesView.addSubview(dismissBtn)
        cointainer.addSubview(succesView)
        view.addSubview(cointainer)
    }
    
    func didClick(){
        loginBtn.backgroundColor = UIColor.redColor()
        println("A message")
        UIView.animateWithDuration(1, animations: { () -> Void in
            if self.succesView.alpha == 1 {
                self.succesView.alpha = 0
            } else {
                self.succesView.alpha = 1
            }
        })
    }

}

