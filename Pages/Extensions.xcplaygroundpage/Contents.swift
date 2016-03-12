import Cocoa

// Extensions

typealias Velocity = Double

extension Velocity {
    var kph: Velocity { return self * 1.60634 }
    var mph: Velocity { return self }
}

protocol VehicleType {
    var topSpeed: Velocity  { get }
    var numberOfDoors: Int { get }
    var hasFlatbed: Bool { get }
}

struct Car {
    
    // Stored properties
    let make: String
    let model: String
    let year: Int
    let color: String
    let nickname: String
    let numberOfDoors: Int
    // Mutable store prop
    var gasLevel: Double {
        willSet {
            precondition(newValue <= 1.0 && newValue >= 0.0, "New value must be betweeen 0 and 1")
        }
    }
}

extension Car: VehicleType {
    var topSpeed: Velocity { return 180 }
    //var numberOfDoors: Int { return self }
    var hasFlatbed: Bool { return false }
}

extension Car {
    // Adding extension for initializer you do not lose your memberwirse provided by Struct
    
    init(carMake: String, carModel: String, carYear: Int, numberOfDoors: Int) {
        self.init(make: carMake, model: carModel, year: carYear, color: "Black", nickname: "N/A", numberOfDoors: numberOfDoors, gasLevel: 1.0)
    }
}

var c = Car(carMake: "Ford", carModel: "Fusion", carYear: 2014, numberOfDoors: 2)

// Nested types and extensions
extension Car {
    
    enum CarKind: CustomStringConvertible {
        
        case Coupe, Sedan
        
        
        var description: String {
            switch self {
            case .Coupe:
                return "Coupe"
            case .Sedan:
                return "Sedan"
            }
        }
    }
    
    var kind: CarKind {
        if numberOfDoors == 2 {
            return .Coupe
        } else {
            return .Sedan
        }
    }
    
}


c.kind.description

extension Car {
    mutating func emptyGas(amount: Double) {
        precondition(amount <= 1 && amount >= 0, "Amount to remove must be between 0 and 1")
        if amount > gasLevel {
            gasLevel = 0
        } else {
            gasLevel -= amount }
    }
    
    mutating func fillGas() {
        gasLevel = 1.0
    }
}

c.emptyGas(0.7)
c.gasLevel
c.emptyGas(0.5)
c.gasLevel
c.fillGas()
c.gasLevel

// Challenge
extension Int {
    var timesFive: Int { return self * 5 }
}

5.timesFive












































