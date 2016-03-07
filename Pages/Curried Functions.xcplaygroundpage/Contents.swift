//: Playground - noun: a place where people can play

import Cocoa

// Funcion curry
func greetName(name: String, withGreeting greeting: String) -> String {
    return "\(greeting) \(name)"
}

let personalGreeting = greetName("Gary", withGreeting: "Hey")
print(personalGreeting)

func greetingForName(name: String) -> (String) -> String {
    func greeting(greeting: String) -> String {
        return "\(greeting) \(name)"
    }
    
    return greeting
}

let greeterFunction = greetingForName("Gary")
let theGreeting = greeterFunction("Hello,")
print(theGreeting)

// Swift - more consise curried function
func greeting(greeting: String)(name: String) -> String {
    return "\(greeting) \(name)"
}

let friendlyGreeting = greeting("Hello,")
let newGreeting = friendlyGreeting(name: "Gary")
print(newGreeting)


// Mutating
struct Person {
    var firstName = "Matt"
    var lastName = "Mathias"
    
    mutating func changeName(fn: String, ln: String) {
        firstName = fn
        lastName = ln
    }
}

var p = Person()
let changer = Person.changeName //- INOUT &&& allows a function to modify the value passed into that parameter
changer(&p)("Gary", ln: "Tokman")
p.firstName
p.changeName("John", ln: "Bob")
p.firstName


