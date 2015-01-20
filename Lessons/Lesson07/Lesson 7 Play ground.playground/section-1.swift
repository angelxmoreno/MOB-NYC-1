// Playground - noun: a place where people can play

import UIKit

var names: [String] = ["Bob", "Sally", "Joe"]

for name in names {
    println(name)
}

enumerate(names)

for (index, name) in enumerate(names){
    println("Name: \(index) is \(name)")
}



