//
//  AddPersonViewController.swift
//  Playing with Arrays
//
//  Created by Angel S. Moreno on 1/19/15.
//  Copyright (c) 2015 Angel S. Moreno. All rights reserved.
//

import UIKit

class AddPersonViewController: UIViewController {

    @IBOutlet weak var coolPersonInput: UITextField!
    
    @IBAction func addCoolPersonBtnClick(sender: AnyObject) {
        
        if coolPersonInput.text != "" {
            
            
            //attempt no 1
//            if let storyBoard = storyboard {
//                let destController = storyBoard.instantiateViewControllerWithIdentifier("TableView") as TableViewController
//                println(destController.tableItems)
//                
//                dismissViewControllerAnimated(true, completion:{
//                    ()-> () in
//                    destController.tableItems.append(self.coolPersonInput.text)
//                })
//
//            }
            
            //attempt no 2
            //attempt no 1
            if let storyBoard = storyboard {
                let destController = storyBoard.instantiateViewControllerWithIdentifier("TableView") as TableViewController
                destController.addNewPerson(coolPersonInput.text)
                dismissViewControllerAnimated(true, completion:nil)
                
            }
            
        }
        
    }


}
