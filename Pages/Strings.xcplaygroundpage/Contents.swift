import Cocoa

// Strings

var mutablePlayground = "Hello, mutable playground"

mutablePlayground += "!"

for c: Character in mutablePlayground.characters {
    print("\(c)")
}

// Unicode scalars
let oneCoolDude = "\u{1F60E}"

let aAcute = "\u{0061}\u{0301}"

for scalar in mutablePlayground.unicodeScalars {
    print("\(scalar.value)")
}


// Using a precomposed character
let aAcutePrecomposed = "\u{00E1}"

let b = aAcute == aAcutePrecomposed // equal because of canonical equivalence

print("aAcute: \(aAcute.characters.count)"); print("aAcuteDecomposed: \(aAcutePrecomposed.characters.count)")

// String indices and ranges
let fromStart = mutablePlayground.startIndex
let toPosition = 4 // The first position is 0
let end = fromStart.advancedBy(toPosition)
let range = fromStart...end
let fifthCharacter = mutablePlayground[range]

// Challenge
// Replace the "Hello" string with an instance created out of its correspoinding Unicode scalars
