//
//  ViewController.swift
//  TodoPlists
//
//  Created by Rudd Taylor on 2/23/15.
//  Copyright (c) 2015 ga. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDataSource, UIAlertViewDelegate {
    
    var items: [String] = []
    var getPath: NSURL {
        get {
            let url = NSFileManager.defaultManager().URLsForDirectory(.DocumentDirectory, inDomains: .UserDomainMask)[0] as NSURL
            
            let fileUrl = url.URLByAppendingPathComponent("ToDos.plist")
            return fileUrl
        }
    }
    
    @IBAction func didTapAdd(sender: AnyObject) {

        var alert = UIAlertView(title: "Item Name?", message: "Enter an item name", delegate: self, cancelButtonTitle: "Dismiss", otherButtonTitles: "Add")
        alert.alertViewStyle = UIAlertViewStyle.PlainTextInput
        alert.show()
    }
    
    func alertView(alertView: UIAlertView, clickedButtonAtIndex buttonIndex: Int) {
        if buttonIndex != alertView.cancelButtonIndex {
            if let textInAlert = alertView.textFieldAtIndex(0)?.text {
                self.items.append(textInAlert)
                let itemsToStore: NSArray = NSArray(array: self.items)
                if itemsToStore.writeToURL(getPath, atomically: true) {
                    println("I saved")
                } else {
                    println("I failed")
                }
                println(itemsToStore)
                
                self.tableView.reloadData()
            }
        }
    }
    
    @IBOutlet weak var tableView: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        if let storedItems = NSArray(contentsOfURL: getPath) {
            self.items = []
            for storedItem in storedItems {
                var singleItem = storedItem as String
                self.items.append(singleItem)
            }
        }
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.items.count
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        var cell = tableView.dequeueReusableCellWithIdentifier("myCell") as UITableViewCell!
        if cell == nil {
            cell = UITableViewCell(style: .Default, reuseIdentifier: "myCell")
        }
        var stringAtSpecifiedIndex = self.items[indexPath.row]
        cell.textLabel?.text = stringAtSpecifiedIndex
        return cell
    }
    
    
}

