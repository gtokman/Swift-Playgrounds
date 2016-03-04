import Cocoa

// Functions

func printGreeting() {
    print("Hello, playground.")
}

printGreeting()

// External parameter names
func divisionDescription(forNumerator num: Double, andDenominator den: Double) {
    print("\(num) divided by \(den) equals \(num / den)")
}

divisionDescription(forNumerator: 9.0, andDenominator: 3.0)

// Variadic parameters
func printPersonalGreeting(names: String...) {
    for name in names {
        print("Hello \(name), welcome to your playground.")
    }
}
printPersonalGreeting("Gary", "John", "Bob")

// Default parameter values
func divisionDescription2(forNumerator num: Double, andDenominator den: Double, withPunctuation punctuation: String = ".") {
    print("\(num) divided by \(den) equals \(num / den)\(punctuation)")
}

divisionDescription2(forNumerator: 10.0, andDenominator: 5.0)
divisionDescription2(forNumerator: 9.0, andDenominator: 3.0, withPunctuation: "!")

// In-out parameters
var error = "The request failed:"
func appendErrorCode(code: Int, inout toErrorString errorString: String) {
    if code == 400 {
        errorString += " bad request."
    }
}
appendErrorCode(400, toErrorString: &error)
error

// Returning
func divisionDescription3(forNumerator num: Double, andDenominator den: Double, withPunctuation punctuation: String = ".") -> String {
    return "\(num) divided by \(den) equals \(num / den)\(punctuation)"
}

print(divisionDescription3(forNumerator: 3.0, andDenominator: 1.0))


// Nested Functions and scope
func areaOfTriangle(withBase base: Double, andHeight height: Double) -> Double {
    let numerator = base * height
    func divide() -> Double {
        return numerator / 2
    }
    
    return divide()
}

areaOfTriangle(withBase: 6.0, andHeight: 6.0)

// Multiple returns tuple
func sortEvenOdd(numbers: [Int]) -> (evens: [Int], odds: [Int]) {
    
    var evens = [Int]()
    var odds = [Int]()
    for number in numbers {
        if number % 2 == 0 {
            evens.append(number)
        } else {
            odds.append(number)
        }
    }
    return (evens, odds)
}

let aBunchOfNumbers = [10, 1, 4, 3, 57, 232,232, 49, 1]
let theSortedNumbers = sortEvenOdd(aBunchOfNumbers)

print("The even numbers are: \(theSortedNumbers.evens); the odd numbers are: \(theSortedNumbers.odds)")

// Optional return types
func grabMiddleName(name: (String, String?, String)) -> String? {
    return name.1
}

let middleName = grabMiddleName(("Gary", nil, "Jeff"))

if let theName = middleName {
    print(theName)
}

// Exiting early
func greetByMiddleName(name: (first: String, middle: String?, last: String)) {
    guard let middleName = name.middle else { // protect your code from running under improper conditions
        print("Hey there!")
        return
    }
    
    print("Hey \(middleName)")
    
}

greetByMiddleName(("Gary", "Jamie", "Jeff"))

// Function types
let evenOddFunction: ([Int]) -> ([Int], [Int]) = sortEvenOdd

// Challenge
func greetByMiddleName2(name: (first: String, middle: String?, last: String)) {
    guard let middleName = name.middle where name.middle?.characters.count >= 4 else { // protect your code from running under improper conditions
        print("Hey there!")
        return
    }
    
    print("Hey \(middleName)")
    
}

greetByMiddleName2(("Gary", "Bobby", "Jeff"))

func beanSifter(groceryList groceries: [String]) -> (beans: [String], otherGroceries: [String]) {
    
    var beans = [String]()
    var otherGroceries = [String]()
    
    for item in groceries {
        if item.hasSuffix("beans") {
            beans.append(item)
        } else {
            otherGroceries.append(item)
        }
        
    }
    
    return (beans, otherGroceries)
}


let results = beanSifter(groceryList: [
    
        "green beans",
        "milk",
        "black beans",
        "pinto beans",
        "apples"
    ])

results.beans == ["green beans", "black beans", "pinto beans"]
results.otherGroceries == ["milk", "apples"]



































