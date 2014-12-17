// Playground - noun: a place where people can play
// Lesson 04

let name = "Angel"
func sayHello(){
    println(name)
}
//sayHello();

// Complete these, in order, writing code under each TODO statement. Each statement calls for a function to be written, write each of them and then immediately call it after the function definition.

// TODO: Write a function that prints out "Hello world!" 10 times


func sayHelloWorld(){
    for i in 1...10 {
        println("Hello world!")
    }
}
//sayHelloWorld()

// TODO: Write a function that prints out "Hit this line {number of iterations of the loop} times!" 20 times
func hitIt(){
    for i in 1...20 {
        println("Hit this line \(i) times!")
    }
}

//hitIt()

// TODO: Write a function that accepts a string as a parameter. Print "Hello {value of string}!"

func printParam(val:String){
    println("Hello \(val)!")
}
//printParam("Anti Hero");

// TODO: Write a function accepts a string optional. If the string optional exists, print "Hello {value of string}!". If it doesn't, print "Hello world!"
func printOptional(val:String?){
    var output:String
    if let exists = val {
        output = "Hello \(exists)!"
    } else {
        output = "Hello world!"
    }
    println(output);
}
printOptional("Anti Hero")
printOptional(nil)

// TODO: Write a function that takes one parameter, n, and returns an integer, the nth series in the fibonacci
// sequence. The first fibonacci number is 0, the second is 1, the third is 1, the fourth is 2, fifth is 3, sixth is 5, etc. fibonacci numbers at sequence n are the sum of the n-1 and n-2 fibonacci number.

// TODO: Write a function that calls the above function in order to print the sum of the first 20 fibonacci numbers.
//blah


// TODO: Write a function that takes in a number and prints out whether it is prime, composite or neither.

// TODO: Write a function that prints out each of the first 20 fibonacci numbers and whether they are prime. (e.g. 0 is not prime or composite, 1 is prime, etc)

// TODO: Write a function that takes in two numbers, a bill amount and an optional tip percentage (represented as a float, e.g. .2 = 20% tip). Return a tuple with the total bill amount and the tip amount (if included).

func calTotalAmount(bill: Float, tipPercent: Float) -> (Float, Float) {
    return (bill, bill*tipPercent)
}

func printTotalAmount(bill: Float, tipPercent: Float){
    var calulcatedTotal = calTotalAmount(bill, tipPercent)
    var tip = calulcatedTotal.1
    var total = bill + tip;
    println("Your bill is $\(bill) with an optinal tip of $\(tip) totalling $\(total)")
}

printTotalAmount(10.00, 0.20);

// TODO: Write a function that takes in a string and returns a string that is the reverse of the input. Append two strings using the + operator.

var aString = "FooBar"
var bString = "Bob"
var cString = "ana"

func reverseString(string2analyze: String) -> String {
    var reversedString = String();
    var stringLength = string2analyze.endIndex;
    for character in string2analyze {
        reversedString = [character] + reversedString;
    }
    
    return reversedString;
}

func mirror(string: String) {
    println(string + reverseString(string))
}

mirror(aString);
mirror(bString);
mirror(cString);

// BONUS TODO: Write a function that takes in an array of strings and a search term string. Return a boolean indicating whether the search term string exists in the array.

func inArray(string2Search:String, array2loop: [String]) -> Bool{
    var found = false;
    for elm  in array2loop {
        if(elm == string2Search){
            return true;
        }
    }
    return false;
}

println(inArray("foo", ["bar", "foo"]))
println(inArray("foo2", ["bar", "foo"]))


// BONUS TODO: Write a function that accepts a string and returns a boolean indicating whether a string is a palindrome (reads the same backwards or forwards).

func isPalindrome(word:String) -> Bool {
    return word == reverseString(word);
}

isPalindrome(aString);
isPalindrome(bString);
isPalindrome(cString);

// BONUS TODO: Write a function that takes in two strings and returns a boolean indicating whether the two strings
//@todo the two strings are what Mr. T ?

// BONUS TODO: Write a function that accepts two parameters, a string and a function that accepts a string and returns a string. Print the result of passing the string into the function 10 times.

func testFunc(aString:String, aFunc: (String) -> String) -> String{
    return aFunc(aString)
}


for i in 1...10 {
    println(testFunc(aString, reverseString))
}
















