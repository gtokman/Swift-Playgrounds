//: [Previous](@previous)

import Foundation

protocol ExerciseType: CustomStringConvertible {
    var name: String { get }
    var title: String { get }
    var caloriesBurned: Double { get }
    var minutes: Double { get }
}

// Default Implentations with Protocol extensions

extension ExerciseType {
    var description: String {
        return "Exercise(\(name), burned \(caloriesBurned) calories in \(minutes) minutes."
    }
    
}


struct EllipticalTrainer: ExerciseType {
    var name: String = "Elliptical Machine"
    var title: String = "Go fast Elliptical Machine 3000"
    
    var caloriesBurned: Double
    var minutes: Double
}

struct Treadmill: ExerciseType {
    var name: String = "Treadmill"
    var title: String
    var caloriesBurned: Double
    var minutes: Double
    let distanceInMiles: Double
}

extension Treadmill {
    var description: String {
        return "Treadmill(\(caloriesBurned) calories and \(distanceInMiles) miles in \(minutes) minutes."
    }
    
}

let ellipticalWorkout = EllipticalTrainer(name: "Elliptical Machine", title: "Go Fast", caloriesBurned: 335, minutes: 30)
let runningWorkout = Treadmill(name: "Treadmill", title: "Go!", caloriesBurned: 350, minutes: 25, distanceInMiles: 4.2)

// Extending ExerciseType

//func caloriesBurnedPerMinute<Exercise: ExerciseType>(exercise: Exercise) -> Double {
//    return exercise.caloriesBurned / exercise.minutes
//}

extension ExerciseType {
    var caloriesBurnedPerMinute: Double {
        return caloriesBurned / minutes
    }
    
}

print(ellipticalWorkout.caloriesBurnedPerMinute)
print(runningWorkout.caloriesBurnedPerMinute)

// Protocol Extension where Clauses
extension SequenceType where Generator.Element == ExerciseType {
    func totalCaloriesBurned() -> Double {
        var total: Double = 0
        for exercise in self {
            total += exercise.caloriesBurned
        }
        return total
    }
}

let mondayWorkout: [ExerciseType] = [ellipticalWorkout, runningWorkout]
print(mondayWorkout.totalCaloriesBurned())
print(ellipticalWorkout)
print(runningWorkout)





print(ellipticalWorkout.title)
print(runningWorkout.title)











