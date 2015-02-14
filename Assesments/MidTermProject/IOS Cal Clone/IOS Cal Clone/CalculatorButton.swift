//
//  CalculatorButton.swift
//  IOS Cal Clone
//
//  Created by Angel S. Moreno on 2/11/15.
//  Copyright (c) 2015 Angel S. Moreno. All rights reserved.
//

import UIKit

class CalculatorButton: UIButton {
    var label: UILabel = UILabel()
    var highlightedColor: UIColor?
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        commonInit()
    }
    
    required init(coder: NSCoder) {
        super.init(coder: coder)
        commonInit()
    }
    
    func commonInit(){
        self.addSubview(self.label)
        self.addConstraint(NSLayoutConstraint(
            item: self.label,
            attribute: NSLayoutAttribute.CenterX,
            relatedBy: NSLayoutRelation.Equal,
            toItem: self,
            attribute: NSLayoutAttribute.CenterX,
            multiplier: 1,
            constant: 0
        ))
        
        self.addConstraint(NSLayoutConstraint(
            item: self.label,
            attribute: NSLayoutAttribute.CenterY,
            relatedBy: NSLayoutRelation.Equal,
            toItem: self,
            attribute: NSLayoutAttribute.CenterY,
            multiplier: 1,
            constant: 0
        ))
        self.label.textAlignment = NSTextAlignment.Center
    }
    
//    override override func touchesBegan(touches: NSSet, withEvent event: UIEvent) {
////        code
//    }

}
