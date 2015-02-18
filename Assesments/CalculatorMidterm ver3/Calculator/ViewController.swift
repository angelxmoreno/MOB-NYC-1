//
//  ViewController.swift
//  Calculator
//
//  Created by Charlyn Buchanan on 2/10/15.
//  Copyright (c) 2015 Charlyn Buchanan. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    var displayLabel = UILabel()
    let CalModel = CalculatorClass();
    override func viewDidLoad() {
                super.viewDidLoad()
                autolayout()
    }
    func autolayout() {
        
        //Display Label
        self.view.addSubview(displayLabel)
        displayLabel.setTranslatesAutoresizingMaskIntoConstraints(false)
        displayLabel.backgroundColor = UIColor(red: 123/255, green: 145/255, blue: 156/255, alpha: 1.0)
        displayLabel.text = CalModel.display
        displayLabel.textColor = UIColor.whiteColor()
        displayLabel.textAlignment = .Right
        displayLabel.font = UIFont.systemFontOfSize(70)
        var adjustsFontSizeToFitWidth: Bool
        
        self.view.addConstraint(NSLayoutConstraint(
            item: displayLabel,
            attribute: .Left,
            relatedBy: .Equal,
            toItem: view,
            attribute: .Left,
            multiplier: 1.0,
            constant: 0))
        self.view.addConstraint(NSLayoutConstraint(
            item: displayLabel,
            attribute: .Right,
            relatedBy: .Equal,
            toItem: view,
            attribute: .Right,
            multiplier: 1.0,
            constant: 0))
        self.view.addConstraint(NSLayoutConstraint(
            item: displayLabel,
            attribute: .Top,
            relatedBy: .Equal,
            toItem: view,
            attribute: .Top,
            multiplier: 1.0,
            constant: 0))
        self.view.addConstraint(NSLayoutConstraint(
            item: displayLabel,
            attribute: .Height,
            relatedBy: .Equal,
            toItem: nil,
            attribute: NSLayoutAttribute.NotAnAttribute,
            multiplier: 1.0,
            constant: 100))

        //Number Pad View

        var buttonView = UIView()
        self.view.addSubview(buttonView)
        buttonView.setTranslatesAutoresizingMaskIntoConstraints(false)
        buttonView.backgroundColor = UIColor.blackColor()
        
        self.view.addConstraint(NSLayoutConstraint(
            item: buttonView,
            attribute: .Left,
            relatedBy: .Equal,
            toItem: view,
            attribute: .Left,
            multiplier: 1.0,
            constant: 0))
        self.view.addConstraint(NSLayoutConstraint(
            item: buttonView,
            attribute: .Bottom,
            relatedBy: .Equal,
            toItem: view,
            attribute: .Bottom,
            multiplier: 1.0,
            constant: 0))
        self.view.addConstraint(NSLayoutConstraint(
            item: buttonView,
            attribute: .Right,
            relatedBy: .Equal,
            toItem: view,
            attribute: .Right,
            multiplier: 1.0,
            constant: 0))
        self.view.addConstraint(NSLayoutConstraint(
            item: buttonView,
            attribute: .Top,
            relatedBy: .Equal,
            toItem: displayLabel,
            attribute: .Bottom,
            multiplier: 1.0,
            constant: 0))
        
        var one = UIButton()
        var two = UIButton()
        var three = UIButton()
        var four = UIButton()
        var five = UIButton()
        var six = UIButton()
        var seven = UIButton()
        var eight = UIButton()
        var nine = UIButton()
        var zero = UIButton()
        var point = UIButton()
        var equals = UIButton()
        var plus = UIButton()
        var minus = UIButton()
        var times = UIButton()
        var dividedBy  = UIButton()
        var percent = UIButton()
        var negation = UIButton()
        var clear = UIButton()
        var allClear = UIButton()
        

        var buttons = [one, two, three, four, five, six, seven, eight, nine, zero, point, equals, plus, minus, times, dividedBy, negation, percent, clear, allClear]
        
        for buttons in [one, two, three, four, five, six, seven, eight, nine, zero, point, equals, plus, minus, times, dividedBy, percent, negation, clear, allClear] {
            buttons.setTranslatesAutoresizingMaskIntoConstraints(false)
            buttons.layer.borderWidth = 6
            buttons.layer.cornerRadius = 25
            buttons.titleLabel!.font = UIFont (name: "Arial", size: 40)
            buttonView.addSubview(buttons)
            self.view.addConstraint(NSLayoutConstraint(
                item: buttons,
                attribute: .Height,
                relatedBy: .Equal,
                toItem: buttonView,
                attribute: .Height,
                multiplier: 0.2,
                constant: 0))
            self.view.addConstraint(NSLayoutConstraint(
                item: buttons,
                attribute: .Width,
                relatedBy: .Equal,
                toItem: buttonView,
                attribute: .Width,
                multiplier: 0.25,
                constant: 0))
        }
        
        var numbers = [one, two, three, four, five, six, seven, eight, nine, zero, point, allClear]
            for numbers in [one, two, three, four, five, six, seven, eight, nine, zero, point, allClear] {
            numbers.backgroundColor = UIColor.grayColor()
            }
        var functions = [dividedBy, times, plus, minus, equals]
            for functions in [dividedBy, times, plus, minus, equals] {
                functions.backgroundColor = UIColor(red:75/255, green:106/255,blue:122/255,alpha:1.0)
            }
        var secondaryFunctions = [clear, percent, negation]
            for secondaryFunctions in [clear, percent, negation] {
                secondaryFunctions.backgroundColor = UIColor.lightGrayColor()
            }
        equals.setTitle("=", forState: UIControlState.Normal)
        point.setTitle(".", forState: UIControlState.Normal)
        zero.setTitle("0", forState: UIControlState.Normal)
        one.setTitle("1", forState: UIControlState.Normal)
        two.setTitle("2", forState: UIControlState.Normal)
        three.setTitle("3", forState: UIControlState.Normal)
        four.setTitle("4", forState: UIControlState.Normal)
        five.setTitle("5", forState: UIControlState.Normal)
        six.setTitle("6", forState: UIControlState.Normal)
        seven.setTitle("7", forState: UIControlState.Normal)
        eight.setTitle("8", forState: UIControlState.Normal)
        nine.setTitle("9", forState: UIControlState.Normal)
        plus.setTitle("+", forState: UIControlState.Normal)
        minus.setTitle("-", forState: UIControlState.Normal)
        times.setTitle("x", forState: UIControlState.Normal)
        clear.setTitle("C", forState: UIControlState.Normal)
        negation.setTitle("+/-", forState: UIControlState.Normal)
        percent.setTitle("%", forState: UIControlState.Normal)
        dividedBy.setTitle("÷", forState: UIControlState.Normal)
        allClear.setTitle("AC", forState: UIControlState.Normal)
        
        let rowOne = [clear, negation, percent, dividedBy]
        let rowTwo = [eight, nine, times]
        let rowThree = [four, five, six, minus]
        //let rowFour = [one, two, three, plus]
        let rowFive = [allClear, zero, point, equals]
       // let columnOne = [clear, seven, four, one, allClear]
        let columnTwo = [eight, five, two]
        //let columnThree = [percent, nine, six, three, point]
        let columnFour = [times, minus, plus]
        
        for rowOne in [clear, negation, percent, dividedBy] {
            self.view.addConstraint(NSLayoutConstraint(
                item: rowOne,
                attribute: .Top,
                relatedBy: .Equal,
                toItem: buttonView,
                attribute: .Top,
                multiplier: 1.0,
                constant: 0))
        }
        self.view.addConstraint(NSLayoutConstraint(
            item: clear,
            attribute: .Left,
            relatedBy: .Equal,
            toItem: buttonView,
            attribute: .Left,
            multiplier: 1.0,
            constant: 0))
        self.view.addConstraint(NSLayoutConstraint(
            item: negation,
            attribute: .Left,
            relatedBy: .Equal,
            toItem: clear,
            attribute: .Right,
            multiplier: 1.0,
            constant: 0))
        self.view.addConstraint(NSLayoutConstraint(
            item: percent,
            attribute: .Left,
            relatedBy: .Equal,
            toItem: negation,
            attribute: .Right,
            multiplier: 1.0,
            constant: 0))
        self.view.addConstraint(NSLayoutConstraint(
            item: dividedBy,
            attribute: .Right,
            relatedBy: .Equal,
            toItem: buttonView,
            attribute: .Right,
            multiplier: 1.0,
            constant: 0))
        for rowFive in [allClear, zero, point, equals] {
            self.view.addConstraint(NSLayoutConstraint(
                item: rowFive,
                attribute: .Bottom,
                relatedBy: .Equal,
                toItem: buttonView,
                attribute: .Bottom,
                multiplier: 1.0,
                constant: 0))
        }
        self.view.addConstraint(NSLayoutConstraint(
            item: zero,
            attribute: .Left,
            relatedBy: .Equal,
            toItem: allClear,
            attribute: .Right,
            multiplier: 1.0,
            constant: 0))
        
        self.view.addConstraint(NSLayoutConstraint(
            item: point,
            attribute: .Left,
            relatedBy: .Equal,
            toItem: zero,
            attribute: .Right,
            multiplier: 1.0,
            constant: 0))
        self.view.addConstraint(NSLayoutConstraint(
            item: equals,
            attribute: .Right,
            relatedBy: .Equal,
            toItem: buttonView,
            attribute: .Right,
            multiplier: 1.0,
            constant: 0))
        var columnOne = [seven, four, one]
        for columnOne in [seven, four, one] {
            self.view.addConstraint(NSLayoutConstraint(
            item: columnOne,
            attribute: .Left,
            relatedBy: .Equal,
            toItem: buttonView,
            attribute: .Left,
            multiplier: 1.0,
            constant: 0))
        }
        self.view.addConstraint(NSLayoutConstraint(
            item: seven,
            attribute: .Top,
            relatedBy: .Equal,
            toItem: clear,
            attribute: .Bottom,
            multiplier: 1.0,
            constant: 0))
        self.view.addConstraint(NSLayoutConstraint(
            item: four,
            attribute: .Top,
            relatedBy: .Equal,
            toItem: seven,
            attribute: .Bottom,
            multiplier: 1.0,
            constant: 0))
        self.view.addConstraint(NSLayoutConstraint(
            item: one,
            attribute: .Top,
            relatedBy: .Equal,
            toItem: four,
            attribute: .Bottom,
            multiplier: 1.0,
            constant: 0))
        for columnFour in [times, minus, plus] {
        self.view.addConstraint(NSLayoutConstraint(
            item: columnFour,
            attribute: .Right,
            relatedBy: .Equal,
            toItem: buttonView,
            attribute: .Right,
            multiplier: 1.0,
            constant: 0))
        }
        self.view.addConstraint(NSLayoutConstraint(
            item: times,
            attribute: .Top,
            relatedBy: .Equal,
            toItem: dividedBy,
            attribute: .Bottom,
            multiplier: 1.0,
            constant: 0))
        self.view.addConstraint(NSLayoutConstraint(
            item: minus,
            attribute: .Top,
            relatedBy: .Equal,
            toItem: times,
            attribute: .Bottom,
            multiplier: 1.0,
            constant: 0))
        self.view.addConstraint(NSLayoutConstraint(
            item: plus,
            attribute: .Top,
            relatedBy: .Equal,
            toItem: minus,
            attribute: .Bottom,
            multiplier: 1.0,
            constant: 0))
        self.view.addConstraint(NSLayoutConstraint(
            item: three,
            attribute: .Right,
            relatedBy: .Equal,
            toItem: plus,
            attribute: .Left,
            multiplier: 1.0,
            constant: 0))
        self.view.addConstraint(NSLayoutConstraint(
            item: two,
            attribute: .Right,
            relatedBy: .Equal,
            toItem: three,
            attribute: .Left,
            multiplier: 1.0,
            constant: 0))
        self.view.addConstraint(NSLayoutConstraint(
            item: two,
            attribute: .Bottom,
            relatedBy: .Equal,
            toItem: zero,
            attribute: .Top,
            multiplier: 1.0,
            constant: 0))
        self.view.addConstraint(NSLayoutConstraint(
            item: five,
            attribute: .Bottom,
            relatedBy: .Equal,
            toItem: two,
            attribute: .Top,
            multiplier: 1.0,
            constant: 0))
        self.view.addConstraint(NSLayoutConstraint(
            item: five,
            attribute: .Left,
            relatedBy: .Equal,
            toItem: four,
            attribute: .Right,
            multiplier: 1.0,
            constant: 0))
        self.view.addConstraint(NSLayoutConstraint(
            item: three,
            attribute: .Bottom,
            relatedBy: .Equal,
            toItem: point,
            attribute: .Top,
            multiplier: 1.0,
            constant: 0))
        self.view.addConstraint(NSLayoutConstraint(
            item: six,
            attribute: .Left,
            relatedBy: .Equal,
            toItem: five,
            attribute: .Right,
            multiplier: 1.0,
            constant: 0))
        self.view.addConstraint(NSLayoutConstraint(
            item: six,
            attribute: .Bottom,
            relatedBy: .Equal,
            toItem: three,
            attribute: .Top,
            multiplier: 1.0,
            constant: 0))
        self.view.addConstraint(NSLayoutConstraint(
            item: six,
            attribute: .Bottom,
            relatedBy: .Equal,
            toItem: three,
            attribute: .Top,
            multiplier: 1.0,
            constant: 0))
        self.view.addConstraint(NSLayoutConstraint(
            item: eight,
            attribute: .Bottom,
            relatedBy: .Equal,
            toItem: five,
            attribute: .Top,
            multiplier: 1.0,
            constant: 0))
        self.view.addConstraint(NSLayoutConstraint(
            item: eight,
            attribute: .Left,
            relatedBy: .Equal,
            toItem: seven,
            attribute: .Right,
            multiplier: 1.0,
            constant: 0))
        self.view.addConstraint(NSLayoutConstraint(
            item: nine,
            attribute: .Bottom,
            relatedBy: .Equal,
            toItem: six,
            attribute: .Top,
            multiplier: 1.0,
            constant: 0))
        self.view.addConstraint(NSLayoutConstraint(
            item: nine,
            attribute: .Right,
            relatedBy: .Equal,
            toItem: times,
            attribute: .Left,
            multiplier: 1.0,
            constant: 0))
    
        //Button Action Stuff
        one.addTarget(self, action: "onePressed:", forControlEvents: UIControlEvents.TouchUpInside)
        two.addTarget(self, action: "twoPressed:", forControlEvents: UIControlEvents.TouchUpInside)
        three.addTarget(self, action: "threePressed:", forControlEvents: UIControlEvents.TouchUpInside)
        four.addTarget(self, action: "fourPressed:", forControlEvents: UIControlEvents.TouchUpInside)
        five.addTarget(self, action: "fivePressed:", forControlEvents: UIControlEvents.TouchUpInside)
        six.addTarget(self, action: "sixPressed:", forControlEvents: UIControlEvents.TouchUpInside)
        seven.addTarget(self, action: "sevenPressed:", forControlEvents: UIControlEvents.TouchUpInside)
        eight.addTarget(self, action: "eightPressed:", forControlEvents: UIControlEvents.TouchUpInside)
        nine.addTarget(self, action: "ninePressed:", forControlEvents: UIControlEvents.TouchUpInside)
        zero.addTarget(self, action: "zeroPressed:", forControlEvents: UIControlEvents.TouchUpInside)
        clear.addTarget(self, action: "clearPressed:", forControlEvents: UIControlEvents.TouchUpInside)
        negation.addTarget(self, action: "negationPressed:", forControlEvents: UIControlEvents.TouchUpInside)
        percent.addTarget(self, action: "percentPressed:", forControlEvents: UIControlEvents.TouchUpInside)
        dividedBy.addTarget(self, action: "dividedByPressed:", forControlEvents: UIControlEvents.TouchUpInside)
        times.addTarget(self, action: "timesPressed:", forControlEvents: UIControlEvents.TouchUpInside)
        minus.addTarget(self, action: "minusPressed:", forControlEvents: UIControlEvents.TouchUpInside)
        plus.addTarget(self, action: "plusPressed:", forControlEvents: UIControlEvents.TouchUpInside)
        equals.addTarget(self, action: "equalsPressed:", forControlEvents: UIControlEvents.TouchUpInside)
        point.addTarget(self, action: "pointPressed:", forControlEvents: UIControlEvents.TouchUpInside)
        allClear.addTarget(self, action: "allClearPressed:", forControlEvents: UIControlEvents.TouchUpInside)

    }


    //Testing Button Action Stuff
    func onePressed(object : UIButton) {
        self.displayLabel.text = CalModel.appendNumber(1)
        println("one was pressed")
    }
    
    func twoPressed(object: UIButton) {
        self.displayLabel.text = CalModel.appendNumber(2)
        println("two was pressed")
    }
    
    func threePressed(object: UIButton) {
        self.displayLabel.text = CalModel.appendNumber(3)
        println("three was pressed")
    }
    
    func fourPressed(object: UIButton) {
        self.displayLabel.text = CalModel.appendNumber(4)
        println("four was pressed")
    }
    
    func fivePressed(object: UIButton) {
        self.displayLabel.text = CalModel.appendNumber(5)
        println("five was pressed")
    }
    
    func sixPressed(object: UIButton) {
        self.displayLabel.text = CalModel.appendNumber(6)
        println("six was pressed")
    }
    
    func sevenPressed(object: UIButton) {
        self.displayLabel.text = CalModel.appendNumber(7)
        println("seven was pressed")
    }
    
    func eightPressed(object: UIButton) {
        self.displayLabel.text = CalModel.appendNumber(8)
        println("eight was pressed")
    }
    
    func ninePressed(object: UIButton) {
        self.displayLabel.text = CalModel.appendNumber(9)
        println("nine was pressed")
    }
    
    func zeroPressed(object: UIButton) {
        self.displayLabel.text = CalModel.appendNumber(0)
        println("zero was pressed")
    }
    
    func pointPressed(object: UIButton) {
        self.displayLabel.text = CalModel.appendOperation(CalculatorOperation.Decimal)
        println("point was pressed")
    }
    
    func clearPressed(object: UIButton) {
        self.displayLabel.text = CalModel.appendOperation(CalculatorOperation.ClearLast)
        println("clear was pressed")
    }
    
    func negationPressed(object: UIButton) {
        self.displayLabel.text = CalModel.appendOperation(CalculatorOperation.Negate)
        println("negation was pressed")
    }
    
    func percentPressed(object: UIButton) {
        self.displayLabel.text = CalModel.appendOperation(CalculatorOperation.Percent)
        println("percent was pressed")
    }
    
    func dividedByPressed(object: UIButton) {
        self.displayLabel.text = CalModel.appendOperation(CalculatorOperation.Divide)
        println("dividedBy was pressed")
    }
    
    func timesPressed(object: UIButton) {
        self.displayLabel.text = CalModel.appendOperation(CalculatorOperation.Multiply)
        println("times was pressed")
    }
    
    func minusPressed(object: UIButton) {
        self.displayLabel.text = CalModel.appendOperation(CalculatorOperation.Subtract)
        println("minus was pressed")
    }
    
    func plusPressed(object: UIButton) {
        self.displayLabel.text = CalModel.appendOperation(CalculatorOperation.Add)
        println("plus was pressed")
    }
    
    func equalsPressed(object: UIButton) {
        self.displayLabel.text = CalModel.appendOperation(CalculatorOperation.Equals)
        println("equals was pressed")
    }
    
    func allClearPressed(object: UIButton) {
        self.displayLabel.text = CalModel.appendOperation(CalculatorOperation.ClearAll)
        println("allClear was pressed")
    }
    
    func buttonAction(sender: UIButton!){
        println("Button tapped")
    }

}