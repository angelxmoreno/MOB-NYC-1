//
//  Feline.swift
//  Lesson03
//
//  Created by Angel S. Moreno on 1/16/15.
//  Copyright (c) 2015 General Assembly. All rights reserved.
//

import UIKit

class Feline: Animal {
    override func prettyAnimalName() -> String {
        return "Feline name: " + self.name
    }
}
