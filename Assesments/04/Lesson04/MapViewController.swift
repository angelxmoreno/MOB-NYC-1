//
//  MapViewController.swift
//  Lesson04
//
//  Created by Rudd Taylor on 9/28/14.
//  Copyright (c) 2014 General Assembly. All rights reserved.
//

import UIKit

class MapViewController: UIViewController, UITableViewDelegate, UITableViewDataSource, UITextFieldDelegate  {
    let tableView: UITableView = UITableView()
    let textField1: UITextField = UITextField()
    let textField2: UITextField = UITextField()
    
    var items: [[String:String]] = []

    override func viewDidLoad() {
        super.viewDidLoad()
        
        /*
        TODO three: Add TWO text views and a table view to this view controller, either using code or storybaord. Accept keyboard input from the two text views. When the 'return' button is pressed on the SECOND text view, add the text view data to a dictionary. The KEY in the dictionary should be the string in the first text view, the VALUE should be the second.
        TODO four: Make this class a UITableViewDelegate and UITableViewDataSource that supply this table view with cells that correspond to the values in the dictionary. Each cell should print out a unique pair of key/value that the map contains. When a new key/value is inserted, the table view should display it.
        TODO five: Make the background of the text boxes in this controller BLUE when the keyboard comes up, and RED when it goes down. Start with UIKeyboardWillShowNotification and NSNotificationCenter.
        */
                
        //create tableView programatically
        tableView.frame = CGRectMake(0, 175, self.view.frame.size.width, self.view.frame.size.height);
        tableView.delegate = self
        tableView.dataSource = self
        tableView.registerClass(UITableViewCell.self, forCellReuseIdentifier: "cell")
        
        //create textField1 programatically
        textField1.frame = CGRectMake(0, 75, self.view.frame.size.width, 50);
        textField1.borderStyle = UITextBorderStyle.Line
        textField1.placeholder = "Key"
        
        textField2.frame = CGRectMake(0, 125, self.view.frame.size.width, 50);
        textField2.borderStyle = UITextBorderStyle.Line
        textField2.placeholder = "Value"
        textField2.delegate = self
        
        
        self.view.addSubview(textField1)
        self.view.addSubview(textField2)
        self.view.addSubview(tableView)
        let notificationCenter = NSNotificationCenter.defaultCenter()
        
        notificationCenter.addObserver(
            self,
            selector: Selector("keyboardAppearedAction"),
            name: UIKeyboardDidShowNotification,
            object: nil
        )
        
        notificationCenter.addObserverForName(
            UIKeyboardDidHideNotification,
            object: nil,
            queue: nil,
            usingBlock: { (notification) -> Void in
                self.textField1.backgroundColor = UIColor.redColor()
                self.textField2.backgroundColor = UIColor.redColor()
            }

        )
    }
    
    func keyboardAppearedAction(){
        textField1.backgroundColor = UIColor.blueColor()
        textField2.backgroundColor = UIColor.blueColor()
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return items.count
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        var cell:UITableViewCell = tableView.dequeueReusableCellWithIdentifier("cell") as UITableViewCell
        
        var dict = items[indexPath.row]
        if let key = dict.keys.first {
            cell.textLabel?.text =  "\(key) : \(dict[key]!)"
        }
        return cell
    }
    
    func textFieldShouldReturn(textField: UITextField) -> Bool {
        if textField.text != "" {
            var dict:[String:String] = [textField1.text : textField2.text]
            items.append(dict)
            tableView.reloadData()
            textField1.text = ""
            textField2.text = ""
        }
        return true
    }
}
