//
//  TodoObj.swift
//  Todo
//
//  Created by Angel S. Moreno on 1/21/15.
//  Copyright (c) 2015 GA. All rights reserved.
//

import Foundation

struct TodoObj {
    let name: String
    let status: String
    let date: NSDate
    
    init(name: String, status: String, date: NSDate){
        self.name = name
        self.status = status
        self.date = date
    }
    
    func prettyString() -> String {
        return "\(self.name), \(self.status), \(dateToString(self.date))"
    }
    
    func verboseString() -> String {
        return "Name: \(self.name), Status: \(self.status), Date: \(dateToString(self.date))"
    }
    
    func dateToString(date:NSDate) -> String {
        let dateFormatter = NSDateFormatter()
        var theDateFormat = NSDateFormatterStyle.ShortStyle
        dateFormatter.dateStyle = theDateFormat
        return dateFormatter.stringFromDate(date)
    }
}

