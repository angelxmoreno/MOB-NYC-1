// Playground - noun: a place where people can play

import UIKit

var str = "Hello, playground"


let numbers = [0,1,2,3,4]

func add(v1: Int, v2: Int) -> Int {
    return v1 + v2
}

func max(v1: Int, v2: Int) -> Int {
    if v1 >= v2 {
        return v1
    } else {
        return v2
    }
}

func high(v1: Int, v2: Int) -> Int {
    if v1 < v2 {
        return v1
    } else {
        return v2
    }
}

func avg(numbers: Int...) -> Float {
    var count = numbers.count
    var sum = numbers.reduce(0, combine: +)
    return Float(sum / count)
}

avg(5,6,4)

func isEven(num: Int) -> Bool {
    return num % 2 == 0
}

numbers.reduce(0, combine: add)
numbers.reduce(0, combine: max)
numbers.reduce(0, combine: min)


