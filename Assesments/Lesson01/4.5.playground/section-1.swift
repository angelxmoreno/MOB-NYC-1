// Playground - noun: a place where people can play

import UIKit
import Foundation

var str = "Hello, playground"

println(rand())

func getRand() -> Int {
    return Int(rand());
}


func randMultiply(num1 : Int, num2: Int) -> (Int, Int){
    var randNum = Int(arc4random_uniform(4))
    return (num1*randNum, num2*randNum)
}
let foo = randMultiply(5,6)
println(foo.0)
println(foo.1)