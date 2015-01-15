// Playground - noun: a place where people can play

import UIKit
import Foundation

class Human {
    var name: String?
    var age: Int?
    var gender: String?
    
}


class Instructor : Human {
    var expertise : String?
}

var rudd = Instructor()
rudd.name = "Rud"
rudd.age = 29
rudd.expertise = "Life"


var angel = Human()
angel.name = "Angel S. Moreno"
angel.age = 34
angel.gender = "Male"
//angel.expertise = "Life"


