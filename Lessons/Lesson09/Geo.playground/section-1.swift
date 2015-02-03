// Playground - noun: a place where people can play

import UIKit

var width: CGFloat = 500
var height: CGFloat = 500
var size = CGSize(width: width, height: height)

var x: CGFloat = 0
var y: CGFloat = 0
var point = CGPoint(x: x, y: y)

var rect = CGRect(origin: point, size: size)


var container = UIView(frame: rect)
container.backgroundColor = UIColor.redColor()

var halfSubview = UIView(frame: CGRect(x: 0, y: 0, width: width, height: height/2))
halfSubview.backgroundColor = UIColor.blueColor()

container.addSubview(halfSubview)
container