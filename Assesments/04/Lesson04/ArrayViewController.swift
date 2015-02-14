//
//  ViewController.swift
//  Lesson04
//
//  Created by Rudd Taylor on 9/28/14.
//  Copyright (c) 2014 General Assembly. All rights reserved.
//

import UIKit

class ArrayViewController: UIViewController, UITableViewDelegate, UITableViewDataSource, UITextFieldDelegate  {
    let tableView: UITableView = UITableView()
    let textField: UITextField = UITextField()
    
    var items: [String] = []
    override func viewDidLoad() {
        super.viewDidLoad()
        buildButtons()
        /*
        TODO one: Add a table view AND a text input box to this view controller, either in code or via the storyboard. Accept keyboard input from the text view when the return key is pressed. Add the string that was entered into the text view into an array of strings (stored in this class).
        TODO two: Make this class a UITableViewDelegate and UITableViewDataSource that supply the above table view with cells. These cells should correspond to the text entered into the text box. E.g. If the text "one", then "two", then "three" was entered into the text box, there should be three cells in this table view that contain those strings in order.
        
        */
        
        //create tableView programatically
        tableView.frame = CGRectMake(0, 125, self.view.frame.size.width, self.view.frame.size.height);
        tableView.delegate = self
        tableView.dataSource = self
        tableView.registerClass(UITableViewCell.self, forCellReuseIdentifier: "cell")
        
        //create textField programatically
        textField.frame = CGRectMake(0, 75, self.view.frame.size.width, 50);
        textField.borderStyle = UITextBorderStyle.Line
//        textField.backgroundColor = UIColor.redColor()
        textField.placeholder = "Add Stuff"
        textField.delegate = self

        self.view.addSubview(textField)
        self.view.addSubview(tableView)

    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return items.count
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        var cell:UITableViewCell = tableView.dequeueReusableCellWithIdentifier("cell") as UITableViewCell
        cell.textLabel?.text = items[indexPath.row]
        return cell
    }
    
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        println("You selected cell #\(indexPath.row)!")
    }
    
    func textFieldShouldReturn(textField: UITextField) -> Bool {
        if textField.text != "" {
            items.append(textField.text)
            tableView.reloadData()
            textField.text = ""
        }
        return true
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func buildButtons() {
    }
    
    
}
