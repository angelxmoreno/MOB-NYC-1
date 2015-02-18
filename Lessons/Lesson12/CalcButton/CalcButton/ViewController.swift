//
//  ViewController.swift
//  CalcButton
//
//  Created by Rudd Taylor on 2/11/15.
//  Copyright (c) 2015 ga. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var btnContainerView: UIView!
    var btnArray: [CalculatorButton] = []
    let btnStrings: [String] = [
        "AC", "C", "-/+", "%",
        "7", "8", "9", "÷",
        "4", "5", "6", "x",
        "1", "2", "3", "-",
        "0", ".", "=", "+"
    ]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        buildCalBtns()
    }
    
    func buildCalBtns(){
        for btnString in self.btnStrings {
            var btn = CalculatorButton(frame: CGRect())
            btn.label.text = btnString
            
            self.btnContainerView.addSubview(btn)
            btn.setTranslatesAutoresizingMaskIntoConstraints(false)
            
            //set btn sizes
            self.btnContainerView.addConstraint(NSLayoutConstraint(item: btn,
                attribute: NSLayoutAttribute.Height,
                relatedBy: .Equal,
                toItem: self.btnContainerView,
                attribute: NSLayoutAttribute.Height,
                multiplier: 0.2,
                constant: 0))
            self.btnContainerView.addConstraint(NSLayoutConstraint(item: btn,
                attribute: NSLayoutAttribute.Width,
                relatedBy: .Equal,
                toItem: self.btnContainerView,
                attribute: NSLayoutAttribute.Width,
                multiplier: 0.25,
                constant: 0))
//            btn.backgroundColor = UIColor.clearColor()
//            btn.layer.cornerRadius = 5
//            btn.layer.borderWidth = 1
//            btn.layer.borderColor = UIColor.blackColor().CGColor
            self.btnArray.append(btn)
        }
        
        //row1
        for btnIndex in 4...8 {
            var btn = self.btnArray[btnIndex]
            
            //set btn top margins
            self.btnContainerView.addConstraint(NSLayoutConstraint(
                item: btn,
                attribute: NSLayoutAttribute.TopMargin,
                relatedBy: .Equal,
                toItem: self.btnContainerView,
                attribute: NSLayoutAttribute.TopMargin,
                multiplier: 1,
                constant: 0))
            //left margin
            self.btnContainerView.addConstraint(NSLayoutConstraint(
                item: btn,
                attribute: NSLayoutAttribute.LeftMargin,
                relatedBy: .Equal,
                toItem: self.btnContainerView,
                attribute: NSLayoutAttribute.RightMargin,
                multiplier: CGFloat(0.0 + (0.25 * Float(btnIndex))),
                constant: -4))
        }
        
        //row2
        for btnIndex in 0...2 {
            var btn = self.btnArray[btnIndex]
            
            //set btn top margins
            self.btnContainerView.addConstraint(NSLayoutConstraint(
                item: btn,
                attribute: NSLayoutAttribute.BottomMargin,
                relatedBy: .Equal,
                toItem: self.btnContainerView,
                attribute: NSLayoutAttribute.TopMargin,
                multiplier: 0.75,
                constant: 0))
            //left margin
            self.btnContainerView.addConstraint(NSLayoutConstraint(
                item: btn,
                attribute: NSLayoutAttribute.LeftMargin,
                relatedBy: .Equal,
                toItem: self.btnContainerView,
                attribute: NSLayoutAttribute.RightMargin,
                multiplier: CGFloat(0.0 + (0.25 * Float(btnIndex))),
                constant: -4))
        }
    }


}

