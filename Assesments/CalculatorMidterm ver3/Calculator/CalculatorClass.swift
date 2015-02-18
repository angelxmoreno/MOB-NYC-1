//
//  CalculatorClass.swift
//  blah
//
//  Created by Angel S. Moreno on 2/11/15.
//  Copyright (c) 2015 Angel S. Moreno. All rights reserved.
//

import UIKit

enum CalculatorOperation {
    case Add
    case Subtract
    case Multiply
    case Divide
    case Equals
    case Percent
    case Negate
    case Decimal
    case ClearLast
    case ClearAll
    case MemClear
    case MemAdd
    case MemSubtract
    case MemRecover
}

class CalculatorClass {
    var operand1: String = "0"
    var operand2: String?
    var operation: CalculatorOperation?
    var display: String
    var memory: Float = 0
    var divisibleByZeroError = "Divisible by zero is bad!"
    init(){
        self.display = "0"
    }
    
    func appendNumber(operand: String) -> String {
        return appendVal(operand)
    }
    
    func appendNumber(operand: Int) -> String {
        return appendVal("\(operand)")
    }
    
    func appendDecimal() -> String {
        var currentOperand: String = getCurrentOperand()
        var newOperand: String = currentOperand + "."
        setCurrentOperand(newOperand)
        self.display = newOperand
        return newOperand
    }
    
    //this should be taking floats?
    private func appendVal(operand: String) -> String {
        var currentOperand: String = getCurrentOperand()
        
        if currentOperand == "0" {
            println("operand was 0")
            setCurrentOperand(operand)
        } else {
            println("operand has no decimal")
            setCurrentOperand("\(currentOperand)\(operand)")
        }
        self.display = getCurrentOperand()
        
        return self.display
    }
    
    func appendOperation(operationToPerform: CalculatorOperation) -> String{
        //there are two types of operations; those that require both operands and those that do not
        switch operationToPerform {
        case .Add, .Subtract, .Multiply, .Divide:
            //if an operation and a right operand both exist, simulate the .Equal operation
            if let previousOperation = self.operation {
                if let rightOperand = operand2 {
                    //performing an Equals operation should clear the current operation and the
                    appendOperation(CalculatorOperation.Equals)
                }
            }
            self.operation = operationToPerform
        case .Equals:
            performEquals()
        case .Decimal:
            appendDecimal()
        case .ClearAll:
            performClearAll()
        case .ClearLast:
            performClearLast()
        case .Negate:
            performNegation()
        case .Percent:
            performPercent()
        case .MemAdd:
            performMemoryAdd()
        case .MemSubtract:
            performMemorySubtract()
        case .MemClear:
            performMemoryClear()
        case .MemRecover:
            performMemoryRecover()
        default:
            println(operation)
        }
        return self.display
    }
    
    private func performClearAll() -> String {
        self.operand1 = "0"
        self.operand2 = nil
        self.operation = nil
        self.memory = 0
        self.display = self.operand1
        return self.operand1
    }
    
    private func performClearLast() -> String {
        if let leftOperand = self.operand2 {
            self.operand2 = nil
            self.display = self.operand1
        } else {
            self.operation = nil
            self.operand1 = "0"
        }
        self.display = self.operand1
        return self.operand1
    }
    
    private func performNegation() -> String {
        var newOperand = getCurrentOperand()
        if newOperand.0 == "-" {
            newOperand = NSString(string: newOperand).substringFromIndex(1)
        } else {
            newOperand = "-" + newOperand
        }
        setCurrentOperand(newOperand)
        self.display = newOperand
        return newOperand
    }
    
    private func performPercent() -> String {
        calculate(
            getCurrentOperand(),
            rightOperand: "100",
            operation: CalculatorOperation.Divide
        )
        return self.display
    }
    
    private func performMemoryAdd(){
        self.memory = self.memory + NSString(string: getCurrentOperand()).floatValue
    }
    
    private func performMemorySubtract(){
        self.memory = self.memory - NSString(string: getCurrentOperand()).floatValue
    }
    
    private func performMemoryClear(){
        self.memory = 0
    }
    
    private func performMemoryRecover() -> String {
        self.display = "\(self.memory)"
        return self.display
    }
    
    //math functions
    
    private func performEquals() -> String {
        if let operation = self.operation {
            if let rightOperand = self.operand2 {
                calculate(
                    self.operand1,
                    rightOperand: rightOperand,
                    operation: operation
                )
            }
        }
        return self.display
    }
    
    private func calculate(leftOperand: String, rightOperand: String, operation operationToPerform: CalculatorOperation) -> Float {
        var result: Float = 0
        var leftOperand: Float = NSString(string: leftOperand).floatValue
        var rightOperand: Float = NSString(string: rightOperand).floatValue
        switch operationToPerform {
        case .Add:
            result = leftOperand + rightOperand
        case .Subtract:
            result = leftOperand - rightOperand
        case .Multiply:
            result = leftOperand * rightOperand
        case .Divide:
            if rightOperand == 0.0 {
                self.operand1 = self.divisibleByZeroError
            } else {
                result = leftOperand / rightOperand
            }
            
        default:
            println(operation)
        }
        if self.operand1 != self.divisibleByZeroError {
            if floatContainsDecimal(result){
                self.operand1 = "\(result)"
            } else {
                self.operand1 = "\(Int(result))"
            }
        }
        
        self.operand2 = nil
        self.operation = nil
        self.display = self.operand1
        return result
    }
    
    private func getCurrentOperand() -> String {
        if let currentOperation = self.operation {
            if let secondOperand = self.operand2 {
                println("current operand is 2nd as \(secondOperand)")
                return secondOperand
            } else {
                println("current operand is 2nd and new")
                return "0"
            }
        } else {
            println("current operand is 1st as \(self.operand1)")
            return self.operand1
        }
    }
    
    private func setCurrentOperand(numString: String){
        if let currentOperation = self.operation {
            println("setting 2nd operand")
            self.operand2 = numString
        } else {
            println("setting 1st operand")
            self.operand1  = numString
        }
    }
    
    private func floatContainsDecimal(num: Float) -> Bool {
        return num != Float(Int(num))
    }
}

