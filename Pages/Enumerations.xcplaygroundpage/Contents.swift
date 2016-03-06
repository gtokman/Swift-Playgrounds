import Cocoa

// Enumerations
enum TextAlignment: Int {
    case Left       = 20
    case Right      = 30
    case Center     = 40
    case Justify    = 50
    
}

//var alignment: TextAlignment = TextAlignment.Left
var alignment = TextAlignment.Justify


if alignment == .Right {
    print("We should right-align the text!")
}

switch alignment {
case .Left:
    print("Left aligned")
case .Right:
    print("Right aligned")
case .Center:
    print("Center aligned")
case .Justify:
    print("justified")
}

// Raw value
print("Left has raw value \(TextAlignment.Left.rawValue).")
print("Right has raw value \(TextAlignment.Right.rawValue).")
print("Center has raw value \(TextAlignment.Center.rawValue).")
print("Justify has raw value \(TextAlignment.Justify.rawValue).")
print("Alignment var has raw value \(alignment.rawValue).")

// Create a raw value
let myRawValue = 30


// Try to convert the raw calue intoa TextAlignment
if let myAlignment = TextAlignment(rawValue: myRawValue) {
    // Conversion succeeded
    print("successfully converted \(myRawValue) into a TextAlignment")
} else {
    // Conversion failed
    print("\(myRawValue) has no corresponding TextAlignment case.")
}

enum ProgrammingLanguage: String {
    case Swift
    case ObjectiveC =   "Objective-C"
    case C
    case Cpp =          "C++"
    case Java
}

let myFavoriteLanguage = ProgrammingLanguage.Swift
print("My favorite programming language is \(myFavoriteLanguage.rawValue)")

// Methods - is a function that is associated with a type.
enum Lightbulb {
    case On
    case Off
    
    func surfaceTemperatureForAmbientTemperature(ambient: Double) -> Double {
        switch self {
        case .On:
            return ambient + 150.0
        case .Off:
            return ambient
        }
    }
    
    // a enum is a **value type** and methods on value types are not allowed to make chages to self
    mutating func toggle() {
        switch self {
        case .On:
            self = .Off
        case .Off:
            self = .On
        }
    }
    
}

var bulb = Lightbulb.On
let ambientTemperature = 77.0

var bulbTemperature = bulb.surfaceTemperatureForAmbientTemperature(ambientTemperature)
print("the bulb's temperature is \(bulbTemperature)")

bulb.toggle()
bulbTemperature = bulb.surfaceTemperatureForAmbientTemperature(ambientTemperature)
print("he bulb's temperature is \(bulbTemperature)")

// Associated Values - allow you to attch data to inctances of an enumeration, and different cases can have different types of associated values.
enum ShapeDimensions {
    // Point has no associated value - it is dimensionless
    case Point
    
    // Square's associated value is th length of one side
    case Square(Double)
    
    // Rectangle's associated value defines its width and height
    case Rectangle(width: Double, height: Double)
    
    case RightTriangle(base: Double, height: Double)
    
    func area() -> Double {
        switch self {
        case .Point:
            return 0
        case let .Square(side): // pattern matching to bind self's associated
            return side * side
            
        case let .Rectangle(width: w, height: h):
            return w * h
            
        case let .RightTriangle(base: b, height: h):
            return (b / 2) * h
        }
    }
    
    // Challenge
    func perimeter() -> Double {
        
        switch self {
        case .Point:
            return 0
        case let .Square(side):
            return side * 4
            
        case let .Rectangle(width: w, height: h):
            return (w + h) * 2
        case .RightTriangle:
            return 90
        }
        
    }
}

var squareShape = ShapeDimensions.Square(10.0)
var rectShape = ShapeDimensions.Rectangle(width: 5.0, height: 10.0)
var pointShape = ShapeDimensions.Point
var triangleShape = ShapeDimensions.RightTriangle(base: 10.0, height: 2.0)



print("square's area = \(squareShape.area())")
print("rectangle's area = \(rectShape.area())")
print("point's ara = \(pointShape.area())")
print("square's perimeter is \(squareShape.perimeter())")
print("rectangle's perimeter is \(rectShape.perimeter())")
print("Right triangle area is \(triangleShape.area())")

// Recursive Enum's // Does not know the size of Family tree // Store data behind a pointer
enum FamilyTree {
    case NoKnownParents
    indirect case OneKnownParent(name: String, ancestors: FamilyTree)
    indirect case TwoKnownParents(fatherName: String, fastherAncestors: FamilyTree, motherName: String, motherAncestors: FamilyTree)
}

let fredAncestors = FamilyTree.TwoKnownParents(
    fatherName: "Fred Sr.",
    fastherAncestors: .OneKnownParent(name: "Beth", ancestors: .NoKnownParents),
    motherName: "Marsha",
    motherAncestors: .NoKnownParents
)









































































