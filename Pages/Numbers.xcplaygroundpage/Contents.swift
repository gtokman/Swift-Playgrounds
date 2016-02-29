//: [Previous](@previous)

import Cocoa

print("The maximum Int value is \(Int.max)")
print("The minumum Int value is \(Int.min)")
print("The maximum value for a 32-bit integer is \(Int32.max)")
print("The minimum value for a 32-bit integer is \(Int32.min)")

/*
Signed Int = represent both positive and ngative numbers.
Unsigned Int = represent whole numbers greater than or equal to 0.
*/


print("The maximum UInt value is \(UInt.max)")
print("The minumum UInt value is \(UInt.min)")
print("The maximum value for a 32-bit unsigned integer is \(UInt32.max)")
print("The minimum value for a 32-bit unsigned integer is \(UInt32.min)")


let numberOfPages: Int = 10 // Explicit
let numberOfChapters = 3    // Inferred : Implicit

let numberOfPeople: UInt = 40
let volumeAdjectment: Int32 = -1000

print(7%2)

let y: Int8 = 120
let x = y &+ 10

let a: Int16 = 200
let b: Int8 = 50
let c = a + Int16(b)

let d1 = 1.1 // Inferred double
let d2: Double = 1.1
let f1: Float = 100.3

if d1 == d2 {
    print("d1 and d2 are the same!")
}

print("d1 + 0.1 is \(d1 + 0.1)")

if d1 + 0.1 == 1.2 {
    print("d1 + 0.1 is \(d1 + 0.1)")
}
˜






