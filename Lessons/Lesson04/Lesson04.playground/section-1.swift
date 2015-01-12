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
//printOptional("Anti Hero")
//printOptional(nil)

// TODO: Write a function that takes one parameter, n, and returns an integer, the nth series in the fibonacci
// sequence. The first fibonacci number is 0, the second is 1, the third is 1, the fourth is 2, fifth is 3, sixth is 5, etc. fibonacci numbers at sequence n are the sum of the n-1 and n-2 fibonacci number.


/**
create an array from the 0th fibonacci to the 50th
**/
func fillFibonacci() -> [Int]{
    var fibonacci = [0,0,1,1,2,3,5];
    var newFibonacci = 0;

    for pos in fibonacci.count...50 {
        newFibonacci = fibonacci[pos - 1] + fibonacci[pos - 2]
        fibonacci.append(newFibonacci);
    }
    
    return fibonacci;
}

let fibonacciSequence = fillFibonacci();

func nthFibonacci(pos: Int) -> Int{
    return fibonacciSequence[pos]
}

// TODO: Write a function that calls the above function in order to print the sum of the first 20 fibonacci numbers.

func sumFibonacci(endIndex: Int) -> Int{
    //@todo i should check if endIndex is greater than the size of the fibonacciSequence Array
    var sum = 0
    for pos in 1...endIndex {
        sum += fibonacciSequence[pos]
    }
    return sum
}

println(sumFibonacci(4))
println(sumFibonacci(10))
println(sumFibonacci(20))


// TODO: Write a function that takes in a number and prints out whether it is prime, composite or neither.

func hasPositiveDivisors(number: Int) -> Bool {
    var endIndex = number - 1
    for i in 2...endIndex {
        if(number % i == 0){
            return true
        }
    }
    return false
}

func isPrime(number:Int) -> Bool? {
    
    if(number < 2){
        //0,1 should return nil
        return nil
    }
    
    if(number < 4){
        //2,3 should return prime
        return true
    }
    
    return hasPositiveDivisors(number);
}

func primeCheck(number: Int) -> String {
    var check = isPrime(number)
    if  check != nil {
        if(check!){
            return "Prime"
        } else {
            return "Even"
        }
    } else {
        return "neither";
    }
}

var type: String;
for i in 0...10 {
    type = primeCheck(i)
    println("The number \(i) is \(type)")
}
// TODO: Write a function that prints out each of the first 20 fibonacci numbers and whether they are prime. (e.g. 0 is not prime or composite, 1 is prime, etc)

func fibNumber(n: Int) -> Int {
    var n1 = 0, n2 = 1, n3 = 1
    if n <= 0 {
        return -1
    } else if n == 1 {
        return n1
    } else if n == 2 {
        return n2
    } else if n == 3 {
        return n3
    } else {
        for counter in 4...n {
            n1 = n2
            n2 = n3
            n3 = n1 + n2
        }
        return n3
    }
}

func primeDetector(testNumber: Int) -> String {
    
    let neither = "neither"
    let prime = "prime"
    let composite = "composite"
    
    //identify exceptional ints, -, 0, 1, 2
    if testNumber <= 1 {
        return neither
    } else if testNumber == 2 {
        return prime
    } else {
        //divide testNumber by each number that is smaller than it
        for i in 2...(testNumber - 1) {
            if testNumber % i == 0 {
                return composite
            }
        }
        //give result
        return prime
    }
}

func fibPrimeCheck(counter: Int) -> String {
    return primeDetector(fibNumber(counter))
}

fibPrimeCheck(6)
// TODO: Write a function that takes in two numbers, a bill amount and an optional tip percentage (represented as a float, e.g. .2 = 20% tip). Return a tuple with the total bill amount and the tip amount (if included).

func calTip(bill: Float, tipPercent: Float) -> (Float, Float) {
    var tipAmount = bill*tipPercent
    var tipTotal = bill + tipAmount
    return (tipTotal, tipAmount)
}

func printTotalAmount(bill: Float, tipPercent: Float){
    var calulcatedTotal = calTip(bill, tipPercent)
    var total = calulcatedTotal.0
    var tip = calulcatedTotal.1
    println("Your total bill is $\(total) with an optinal tip of $\(tip)")
}

printTotalAmount(10.00, 0.15);

// TODO: Write a function that takes in a string and returns a string that is the reverse of the input. Append two strings using the + operator.

var aString = "FooBar"
var bString = "Bob"
var cString = "ana"

func reverseString(string2analyze: String) -> String {
    var reversedString = String()
    for character in string2analyze {
        reversedString = [character] + reversedString
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
//@todo the two strings are what Mr. T ? - BONUS TODO: Write a function that takes in two strings and returns a boolean indicating whether the two strings have the same number of lowercase 'a's in them
func countChar(string:String, charMatch: Character) -> Int {
    var counter = 0;
    for char in string {
        if(char == charMatch) {
            counter++;
        }
    }
    
    return counter;
}

func charComparision(stringA: String, stringB:String, char: Character) -> Bool {
    return countChar(stringA, char) == countChar(stringB, char);
}

func stringCompareCountCharA(stringA :String, stringB : String) -> Bool {
    return charComparision(stringA, stringB, "a");
}

println(stringCompareCountCharA("Bob", "Annie"));
println(stringCompareCountCharA("Bob", "Tom"));

// BONUS TODO: Write a function that accepts two parameters, a string and a function that accepts a string and returns a string. Print the result of passing the string into the function 10 times.

func testFunc(aString:String, aFunc: (String) -> String) -> String{
    return aFunc(aString)
}


for i in 1...10 {
    println(testFunc(aString, reverseString))
}
















