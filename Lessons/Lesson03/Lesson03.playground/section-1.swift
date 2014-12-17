// Lesson 03 playground

import Foundation

// TODO: Create two variables, name and age. Name is a string, age is an integer.
var name: String = "Angel S. Moreno";
var age: Int = 34;

// TODO: Print "Hello {whatever the value of name is}, you are {whatever the value of age is} years old!"
println("Hello \(name), you are \(age) years old!");

// TODO: Print “You can drink” below the above text if the user is above 21. If they are above 18, print “you can vote”. If they are above 16, print “You can drive”
if(age > 21){
    println("You can drink");
}

if(age > 18){
    println("You can vote");
}

if(age > 16){
    println("You can drive");
}


// TODO: Print “you can drive” if the user is above 16 but below 18. It should print “You can drive and vote” if the user is above 18 but below 21. If the user is above 21, it should print “you can drive, vote and drink (but not at the same time!”.
if(age > 16 && age < 18){
    println("you can drive");
}

if(age > 18 && age < 21){
    println("You can drive and vote");
}

if(age > 21){
    println("you can drive, vote and drink (but not at the same time!");
}


// TODO: Print the first fifty multiples of seven minus one (e.g. the first three multiples are 7, 14, 21. The first three multiples minus one are 6, 13, 20)
for i in 1...50 {
    println(i*7-1)
}

// TODO: Create a constant called number
let number = 20

// TODO: Print whether the above number is even

if(number % 2 == 0){
    println("this is an even number");
}

// TODO: The first fibonacci number is 0, the second is 1, the third is 1, the fourth is two, the fifth is 3, the sixth is 5, etc. The Xth fibonacci number is the sum of the X-1th fibonacci number and the X-2th fibonacci number. Print the 37th fibonacci number below
/*
I am sorry, but i simply can not solve this without yearning for a solution involving arrays ( or whatever SWIFT calls them). Therefore, I will look at the docs for how to build arrays!
*/
var fibonacci: [Int] = [0,1,1,2,3,6];

for i in fibonacci.count...36 {
    var fibonacciTemp = fibonacci;//i don't know how to access an array as Array[i-1]
    var pos1 = fibonacciTemp.removeLast();
    var pos2 = fibonacciTemp.removeLast();
    var currentFibonacci = pos1 + pos2;
    fibonacci.append(currentFibonacci);
}

for (i, e) in enumerate(fibonacci) {
    println("Fibonacci \(i+1) is \(e)")
}

// TODO: Print out "Hello {whatever the value of name is}, your name is {however long the string name is} characters long!. Use countElements()
println("Hello \(name), your name is \(countElements(name)) characters long!.")
// TODO: Print the sum of one hundred random numbers. Use rand() to generate random numbers.

var sum: Int32 = 0;
for i in 0...99 {
    var rNum = rand();
    sum = sum + rNum;
}

println(sum);











