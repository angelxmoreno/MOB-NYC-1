//
//  ViewController.swift
//  Smiley Dude
//
//  Created by Angel S. Moreno on 2/4/15.
//  Copyright (c) 2015 Angel S. Moreno. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
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

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

