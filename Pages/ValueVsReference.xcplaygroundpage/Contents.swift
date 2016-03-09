import Cocoa

// Value Vs Reference Types

/*
Value types are always copied when ther are asssigned to an instance or passed as an argument.
*/
var str = "Hello, playground"
var playgroundGreeting = str
playgroundGreeting += "! How are you doing today?"
str


/*
Reference = a change in one will be reflected in the other - same instance
*/
class GreekGod {
    // Stored properties
    var name: String
    // Init
    init(name: String) {
        self.name = name
    }
}

let hecate = GreekGod(name: "Hecate")
let anotherHecate = hecate

anotherHecate.name = "AnotherHecate"
anotherHecate.name
hecate.name


// Constant value and Regerence Types
struct Pantheon {
    let chiefGod: GreekGod
    let dateCreated = NSDate()
}

let pantheon = Pantheon(chiefGod: hecate)
let zeus = GreekGod(name: "Zeus")
zeus.name = "Zeus Jr"
zeus.name

// Using value and reference types together
pantheon.chiefGod.name
let greekPantheon = pantheon
hecate.name = "Trivia"
greekPantheon.chiefGod.name

// Immutable reference types
greekPantheon.dateCreated

// Coping
let athena = GreekGod(name: "Athena")
let gods = [athena, hecate, zeus]
let godsCopy = gods
gods.last?.name = "Jupiter"
gods
godsCopy

// Identity vs. Equality
// Equality refers to two instances having the same values for their obervable characteristics
// Identity refers to whether two variables point to the same instance in memory
let x = 1
let y = 1
x == y

athena === hecate











