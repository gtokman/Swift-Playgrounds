//: Playground - noun: a place where people can play

import Cocoa

var population: Int = 400000
var message: String
var hasPostOffice: Bool = true

if population < 10000 {
    message = "\(population) is a small town!"
} else if population >= 10000 && population < 50000 {
    message = "\(population) is a meduim town!"
} else if population >= 100000 && population < 500000 {
    message = "\(population) is a large town!"
} else {
    message = "\(population) is a very large town!"
}

// If population is less than 10000 print A else B
//message = population < 10000 ? "\(population) is a small town!" : "\(population) is pretty big!"

print(message)

if !hasPostOffice {
    print("Wheredo we buy stamps?")
}