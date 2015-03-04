//
//  ViewController.swift
//  Weather Checker
//
//  Created by Angel S. Moreno on 3/2/15.
//  Copyright (c) 2015 Angel S. Moreno. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var viewLabel: UILabel!
    let apiUrl = "http://api.openweathermap.org/data/2.5/weather?q=nyc,ny"
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    override func viewDidAppear(animated: Bool) {
        if let url = NSURL(string: self.apiUrl){
            let task = NSURLSession.sharedSession().dataTaskWithURL(
                url,
                completionHandler: handleCompletion
            )
            task.resume()
        }
    }
    
    func handleCompletion(data: NSData!, response: NSURLResponse!, error: NSError!){
        if let jsonDict = NSJSONSerialization.JSONObjectWithData(data, options:NSJSONReadingOptions.allZeros,error: nil) as? NSDictionary {
            
            if let weather = jsonDict["weather"] as? NSArray {
                if let firstWeather = weather.firstObject as? NSDictionary {
                    if let description = firstWeather["description"] as? NSString {
                        dispatch_async(dispatch_get_main_queue(), {
                            self.viewLabel.text = description
                        })
                    }
                }
            }
        }
        
    }
    
}

