//
//  ThirdViewController.swift
//  ViewExercises
//
//  Created by Rudd Taylor on 9/9/14.
//  Copyright (c) 2014 Rudd Taylor. All rights reserved.
//

import UIKit

class ThirdViewController: ExerciseViewController {
    let ul = UIView()
    let ur = UIView()
    let bl = UIView()
    let br = UIView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.exerciseDescription.text = "View 3"
        self.navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Next", style: .Plain, target: self, action: "next")
        /* TODO:
        Build four blue squares, 20 points wide, one in each corner of the screen.
        They must stay in their respective corners on device rotation. 
        
        Use Autolayout.
        
        Your view should be in self.exerciseView, not self.view
        */
        styleViews()
    }
    
    override func shouldAutorotate() -> Bool {
        return true
    }
    
    func next() {
        self.performSegueWithIdentifier("four", sender: nil)
    }
    
    func styleViews(){
        for view in [ul, ur, bl, br] {
            view.backgroundColor = UIColor.blueColor()
            view.setTranslatesAutoresizingMaskIntoConstraints(false)
            self.exerciseView.addSubview(view)
            
            //define size
            let size:CGFloat = 20
            
            //set width
            self.exerciseView.addConstraint(NSLayoutConstraint(
                item: view,
                attribute: .Width,
                relatedBy: .Equal,
                toItem: nil,
                attribute: NSLayoutAttribute.NotAnAttribute,
                multiplier: 1.0,
                constant: size
            ))
            
            //set height
            self.exerciseView.addConstraint(NSLayoutConstraint(
                item: view,
                attribute: .Height,
                relatedBy: .Equal,
                toItem: nil,
                attribute: NSLayoutAttribute.NotAnAttribute,
                multiplier: 1.0,
                constant: size
            ))
        }
        
        //set bl bottom margin
        self.exerciseView.addConstraint(NSLayoutConstraint(
            item: bl,
            attribute: NSLayoutAttribute.Bottom,
            relatedBy: NSLayoutRelation.Equal,
            toItem: self.exerciseView,
            attribute: NSLayoutAttribute.Bottom,
            multiplier: 1.0,
            constant: 44
        ))
        
        //set bl left margin
        self.exerciseView.addConstraint(NSLayoutConstraint(
            item: bl,
            attribute: NSLayoutAttribute.Left,
            relatedBy: NSLayoutRelation.Equal,
            toItem: self.exerciseView,
            attribute: NSLayoutAttribute.Left,
            multiplier: 1.0,
            constant: 0
        ))
    }

}
