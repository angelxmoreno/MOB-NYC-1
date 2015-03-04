//
//  ViewController.swift
//  GooglePrinter
//
//  Created by Rudd Taylor on 2/25/15.
//  Copyright (c) 2015 ga. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var textView: UITextView!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    override func viewDidAppear(animated: Bool) {
        if let url = NSURL(string: "http://baldisB123.com") {
            let task = NSURLSession.sharedSession().dataTaskWithURL(url, completionHandler: { (data, response, error) -> Void in
                if let someError = error {
                    self.handleError(someError)
                } else {
                    self.handleResponse(data)
                }
            })
            task.resume()
        } else {
            urlIsNotValid()
        }
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func urlIsNotValid(){
        println("url not valid")
        self.textView.text = "Url is not a valid URL"
    }
    
    func handleError(error: NSError){
        println("error being handled")
        var string = error.localizedDescription
        
        dispatch_async(dispatch_get_main_queue(), {
            self.textView.text = string
        })
    }
    
    func handleResponse(data: NSData){
        println("response being handled")
        var string = NSString(data: data, encoding: NSUTF8StringEncoding)
        dispatch_async(dispatch_get_main_queue(), {
            self.textView.text = string
        })
    }
    
    
}

