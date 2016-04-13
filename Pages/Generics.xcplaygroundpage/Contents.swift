//: [Previous](@previous)

import Foundation


 /*Swift generics allow you to write types and functions that make use of types that are not yet known to you or the compiler*/

struct StackGenerator<T>: GeneratorType {
    
    
    var stack: Stack<T>
    
    mutating func next() -> T? {
        return stack.pop()
    }
    
}

// Element is a placeholder type
struct Stack <Element>: SequenceType {
    var items = [Element]()
    
    mutating func push(newItem: Element) {
        items.append(newItem)
    }
    
    mutating func pop() -> Element? {
        guard !items.isEmpty else {
            return nil
        }
        
        return items.removeLast()
    }
    
    func map<U>(f: Element -> U) -> Stack<U> {
        var mappedItems = [U]()
        for item in items  {
            mappedItems.append(f(item))
        }
        return Stack<U>(items: mappedItems)
    }
    
    func generate() -> StackGenerator<Element> {
        return StackGenerator(stack: self)
    }
    
    // Challenge
    
    func filter(f: (Element) -> Bool) -> Stack<Element> {
        var filterItems = Stack<Element>()
        
        for item in self {
            if f(item) {
                filterItems.push(item)
            }
        }
        return filterItems
    }
    
}
// Filter check
var aStack = Stack<Int>()
for num in [-5, -4, -3, -2, -1, 0, 1, 2, 3] {
    aStack.push(num)
}

// filter out all non-negative numbers
var myStackNegatives = aStack.filter() {
    (let num: Int) -> (Bool) in
    return num < 0
}
// print filtered stack
for num in myStackNegatives {
    print("\(num)")
}

var intStack = Stack<Int>()
intStack.push(1)
intStack.push(2)
var doubleStack = intStack.map({ 2 * $0})


print(intStack.pop())
print(intStack.pop())
print(intStack.pop())
print(doubleStack.pop())
print(doubleStack.pop())

var stringStack = Stack<String>()
stringStack.push("Hello")
stringStack.push("Sup")

print(stringStack.pop())


/*Generic Functions and Methods*/

func myMap<T, U>(items: [T], f: (T) -> (U)) -> [U]  {
    var result = [U]()
    
    for item in items {
        result.append(f(item))
    }
    return result
}

let strings = ["one", "two", "three"]
let stringLengths = myMap(strings) { $0.characters.count }
print(stringLengths)

// Type Constraints

func checkIfEqual<T: Equatable>(first: T, _ second: T) -> Bool {
    return first == second
}

print(checkIfEqual(1, 1))
print(checkIfEqual("a string", "a string"))
print(checkIfEqual(4, 3))


func checkIfDescriptionMatch<T: CustomStringConvertible, U: CustomStringConvertible>(first: T, _ second: U) -> Bool {
    return first.description == second.description
}

print(checkIfDescriptionMatch(Int(1), Int(1)))
print(checkIfDescriptionMatch(1, 1.0))
print(checkIfDescriptionMatch(Float(1.0), Double(1.0)))

// Associatdd Type Protcols

var myStack = Stack<Int>()
myStack.push(10)
myStack.push(20)
myStack.push(30)

var myStackGenerator = StackGenerator(stack: myStack)

while let value = myStackGenerator.next() {
    print("got \(value)")
}

for value in myStack {
    print("for in loop: got \(value)")
}


// type Constraint where Clauses

func pushItemsOntoStack<Element, S: SequenceType where S.Generator.Element == Element > (inout stack: Stack<Element>, fromSequence sequence: S) {
    for item in sequence {
       stack.push(item)
    }
}

pushItemsOntoStack(&myStack, fromSequence: [1,2,3])
for value in myStack {
    print("After pushing: got \(value)")
}

var myOtherStack = Stack<Int>()
pushItemsOntoStack(&myOtherStack, fromSequence: [1,2,3])
pushItemsOntoStack(&myStack, fromSequence: myOtherStack)
for value in myStack {
    print("after pushing items onto stack, got \(value)")
}

// Challenge




































