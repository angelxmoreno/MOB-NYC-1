//
//  ViewController.swift
//  Todo
//
//  Created by Rudd Taylor on 1/21/15.
//  Copyright (c) 2015 GA. All rights reserved.
//

import UIKit

class ModalViewController: UIViewController {

    @IBOutlet weak var nameInput: UITextField!
    @IBOutlet weak var statusInput: UITextField!
    @IBOutlet weak var dateInput: UIDatePicker!
    var todoViewController: MainTableViewController?
    
    @IBAction func didTapButton(sender: AnyObject) {
        let newTodo = TodoObj(
            name: nameInput.text,
            status: statusInput.text,
            date: dateInput.date
        )
        todoViewController?.todosArray.append(newTodo)
        dismissViewControllerAnimated(true, completion: nil)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let currentDate = NSDate()
        dateInput.minimumDate = currentDate
        dateInput.date = currentDate
    }
}

