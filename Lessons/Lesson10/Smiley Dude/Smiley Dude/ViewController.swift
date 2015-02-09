//
//  ViewController.swift
//  Smiley Dude
//
//  Created by Angel S. Moreno on 2/4/15.
//  Copyright (c) 2015 Angel S. Moreno. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    var leftEye = UIView()
    var rightEye = UIView()
    var nose = UIView()
    var mouth = UIView()

    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        autolayout()
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    func autolayout() {
        leftEye.backgroundColor = UIColor.orangeColor()
        leftEye.setTranslatesAutoresizingMaskIntoConstraints(false)
        view.addSubview(leftEye)
        
        view.addConstraint(NSLayoutConstraint(
            item: leftEye,
            attribute: .Top,
            relatedBy: .Equal,
            toItem: view,
            attribute: .Top,
            multiplier: 2.0,
            constant: 50))
        
        view.addConstraint(NSLayoutConstraint(
            item: leftEye,
            attribute: .CenterX,
            relatedBy: .Equal,
            toItem: view,
            attribute: .CenterX,
            multiplier: 0.5,
            constant: 0))
        view.addConstraint(NSLayoutConstraint(
            item: leftEye,
            attribute: .Width,
            relatedBy: .Equal,
            toItem: nil,
            attribute: NSLayoutAttribute.NotAnAttribute,
            multiplier: 1.0,
            constant: 50))
        view.addConstraint(NSLayoutConstraint(
            item: leftEye,
            attribute: .Height,
            relatedBy: .Equal,
            toItem: nil,
            attribute: NSLayoutAttribute.NotAnAttribute,
            multiplier: 1.0,
            constant: 50))
        
        
        rightEye.backgroundColor = UIColor.blueColor()
        rightEye.setTranslatesAutoresizingMaskIntoConstraints(false)
        view.addSubview(rightEye)
        
        view.addConstraint(NSLayoutConstraint(
            item: rightEye,
            attribute: .Top,
            relatedBy: .Equal,
            toItem: view,
            attribute: .Top,
            multiplier: 2.0,
            constant: 50))
        
        view.addConstraint(NSLayoutConstraint(
            item: rightEye,
            attribute: .CenterX,
            relatedBy: .Equal,
            toItem: view,
            attribute: .CenterX,
            multiplier: 1.5,
            constant: 0))
        view.addConstraint(NSLayoutConstraint(
            item: rightEye,
            attribute: .Width,
            relatedBy: .Equal,
            toItem: nil,
            attribute: NSLayoutAttribute.NotAnAttribute,
            multiplier: 1.0,
            constant: 50))
        view.addConstraint(NSLayoutConstraint(
            item: rightEye,
            attribute: .Height,
            relatedBy: .Equal,
            toItem: nil,
            attribute: NSLayoutAttribute.NotAnAttribute,
            multiplier: 1.0,
            constant: 50))
        
        
        nose.backgroundColor = UIColor.yellowColor()
        nose.setTranslatesAutoresizingMaskIntoConstraints(false)
        view.addSubview(nose)
        
        view.addConstraint(NSLayoutConstraint(
            item: nose,
            attribute: .CenterY,
            relatedBy: .Equal,
            toItem: view,
            attribute: .CenterY,
            multiplier: 1,
            constant: 0))
        
        view.addConstraint(NSLayoutConstraint(
            item: nose,
            attribute: .CenterX,
            relatedBy: .Equal,
            toItem: view,
            attribute: .CenterX,
            multiplier: 1,
            constant: 0))
        view.addConstraint(NSLayoutConstraint(
            item: nose,
            attribute: .Width,
            relatedBy: .Equal,
            toItem: nil,
            attribute: NSLayoutAttribute.NotAnAttribute,
            multiplier: 1.0,
            constant: 50))
        view.addConstraint(NSLayoutConstraint(
            item: nose,
            attribute: .Height,
            relatedBy: .Equal,
            toItem: nil,
            attribute: NSLayoutAttribute.NotAnAttribute,
            multiplier: 1.0,
            constant: 50))
        
        
        mouth.backgroundColor = UIColor.redColor()
        mouth.setTranslatesAutoresizingMaskIntoConstraints(false)
        view.addSubview(mouth)
        
        view.addConstraint(NSLayoutConstraint(
            item: mouth,
            attribute: .CenterY,
            relatedBy: .Equal,
            toItem: nose,
            attribute: .CenterY,
            multiplier: 1,
            constant: 150))
        
        view.addConstraint(NSLayoutConstraint(
            item: mouth,
            attribute: .CenterX,
            relatedBy: .Equal,
            toItem: view,
            attribute: .CenterX,
            multiplier: 1,
            constant: 0))
        view.addConstraint(NSLayoutConstraint(
            item: mouth,
            attribute: .Width,
            relatedBy: .Equal,
            toItem: nil,
            attribute: NSLayoutAttribute.NotAnAttribute,
            multiplier: 1.0,
            constant: 150))
        view.addConstraint(NSLayoutConstraint(
            item: mouth,
            attribute: .Height,
            relatedBy: .Equal,
            toItem: nil,
            attribute: NSLayoutAttribute.NotAnAttribute,
            multiplier: 1.0,
            constant: 50))
        
        view.addGestureRecognizer(UITapGestureRecognizer(target: self, action: "didTap"))
    }
    
    func didTap(){
        
        UIView.animateWithDuration(1.5, animations: {
            self.leftEye.backgroundColor = UIColor.blueColor()
            self.rightEye.backgroundColor = UIColor.blueColor()
            self.nose.backgroundColor = UIColor.blueColor()
            self.mouth.backgroundColor = UIColor.blueColor()
        })
        
        
    }
    
    func setSprings(){
        let topMargin: CGFloat = 50
        let size: CGFloat = 15
        
        let lftEye = UIView(frame: CGRect(
            x: self.view.frame.size.width/4,
            y: self.view.frame.size.height/100,
            width: size,
            height: size
            ))
        
        lftEye.backgroundColor = UIColor.blueColor()
        let rghtEye = UIView(frame: CGRect(x: 0, y: 0, width: size, height: size))
        
        view.addSubview(lftEye)
        view.addSubview(rghtEye)
    }


}

