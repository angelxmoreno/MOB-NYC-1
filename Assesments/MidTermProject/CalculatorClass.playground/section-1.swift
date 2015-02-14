// Playground - noun: a place where people can play

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
}

class Calculator {
    var operand1: Float = 0
    var operand2: Float?
    var operation: CalculatorOperation?
    var display: String
    
    init() {
        self.display = "\(self.operand1)"
    }
    
    func appendNumber(operand: Int) -> String {
        var currentOperand: Float = getCurrentOperand()
        
        if currentOperand == 0.0 {
            println("operand was 0")
            setCurrentOperand(Float(operand))
        } else if floatContainsDecimal(currentOperand){
            //review this part
            setCurrentOperand(NSString(string: "\(currentOperand)\(operand)").floatValue)
                        println("operand was decimal")
        } else {
                        println("operand has no decimal")
            setCurrentOperand(NSString(string: "\(Int(currentOperand))\(operand)").floatValue)
        }
        self.display = "\(getCurrentOperand())"
        
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
        default:
            println(operation)
        }
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
    
    private func calculate(leftOperand: Float, rightOperand: Float, operation operationToPerform: CalculatorOperation) -> Float {
        var result: Float = 0
        switch operationToPerform {
        case .Add:
            result = leftOperand + rightOperand
        case .Subtract:
            result = leftOperand - rightOperand
        case .Multiply:
            result = leftOperand * rightOperand
        case .Divide:
            result = leftOperand / rightOperand
        default:
            println(operation)
        }
        self.operand1 = result
        self.operand2 = nil
        self.operation = nil
        self.display = "\(self.operand1)"
        return result
    }
    
    private func getCurrentOperand() -> Float {
        if let currentOperation = self.operation {
            if let secondOperand = self.operand2 {
                println("current operand is 2nd as \(secondOperand)")
                return secondOperand
            } else {
                println("current operand is 2nd and new")
                return 0
            }
        } else {
            println("current operand is 1st as \(self.operand1)")
            return self.operand1
        }
    }
    
    private func setCurrentOperand(floatVal: Float){
        if let currentOperation = self.operation {
            println("setting 2nd operand")
            self.operand2 = floatVal
        } else {
            println("setting 1st operand")
            self.operand1  = floatVal
        }
    }
    
    private func floatContainsDecimal(num: Float) -> Bool {
        return num != Float(Int(num))
    }
}


var cal = Calculator()
println(cal.floatContainsDecimal(1.0))
println(cal.display)
println(cal.operand1)
println(cal.operand2)
println(cal.operation)

println("Pressing 1")
cal.appendNumber(1)
println(cal.display)
println(cal.operand1)
println(cal.operand2)
println(cal.operation)

println("Pressing 2")
cal.appendNumber(2)
println(cal.display)
println(cal.operand1)
println(cal.operand2)
println(cal.operation)

println("Pressing +")
cal.appendOperation(CalculatorOperation.Add)
println(cal.display)
println(cal.operand1)
println(cal.operand2)
println(cal.operation)

println("Pressing 3")
cal.appendNumber(3)
println(cal.display)
println(cal.operand1)
println(cal.operand2!)
println(cal.operation)

println("Pressing =")
cal.appendOperation(CalculatorOperation.Equals)
println(cal.display)
println(cal.operand1)
println(cal.operand2)
println(cal.operation)


println("Pressing +")
cal.appendOperation(CalculatorOperation.Add)
println(cal.display)
println(cal.operand1)
println(cal.operand2)
println(cal.operation)

println("Pressing 3")
cal.appendNumber(3)
println(cal.display)
println(cal.operand1)
println(cal.operand2)
println(cal.operation)


println("Pressing +")
cal.appendOperation(CalculatorOperation.Add)
println(cal.display)
println(cal.operand1)
println(cal.operand2)
println(cal.operation)



println("Pressing 3")
cal.appendNumber(3)
println(cal.display)
println(cal.operand1)
println(cal.operand2)
println(cal.operation)

println("Pressing =")
cal.appendOperation(CalculatorOperation.Equals)
println(cal.display)
println(cal.operand1)
println(cal.operand2)
println(cal.operation)







