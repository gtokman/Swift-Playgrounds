import Cocoa

// Closures

/*
{(parameters) -> return type in
// Code

}

in - is used to separate the closures parameters and retun type from the stements inside of its body
*/

var volunteerCounts = [1,3, 49, 2, 43, 77, 13]

//func sortAscending(i: Int, j: Int) -> Bool {
//    return i < j
//}

let volunteerSorted1 = volunteerCounts.sort({
    (i: Int, j: Int) -> Bool in
    return i < j
})

// Type inference
let volunteerSorted2 = volunteerCounts.sort({
    (i, j) in i < j
})

let volunteerSorted3 = volunteerCounts.sort {
    $0 < $1 // arguements
}

// Functions as Return Types
func maketownGrand() -> (Int, Int) -> Int {
    func buildRoads(lightsToAdd: Int, toLights: Int) -> Int {
        return toLights + lightsToAdd
    }
    
    return buildRoads
}

var stopLights = 4
let townPlan = maketownGrand()
//stopLights = townPlan(4, stopLights)
print("Knowhere has \(stopLights) stoplights.")

// Functions as agruments
func makeTownGrand2(budget: Int, condition: Int -> Bool) -> ((Int, Int) -> Int)? {
    
    if condition(budget) {
        func buildRoads(lightsToAdd: Int, toLights: Int) -> Int {
            return toLights + lightsToAdd
        }
        
        return buildRoads
    } else {
        return nil
    }
}

func evaluateBudget(budget: Int) -> Bool {
    return budget > 10000
}

if let townPlan = makeTownGrand2(11000, condition: evaluateBudget) {
    stopLights = townPlan(4, stopLights)
}

print("Knowhere has \(stopLights) stoplights")


// Closures capture values
func makeGrowthTracker(forGrowth growth: Int) -> () -> Int {
    var totalGrowth = 0
    func growthTracker() -> Int {
        totalGrowth += growth
        return totalGrowth
    }
    
    return growthTracker
    
}

var currentPopulation = 5422
let growBy500 = makeGrowthTracker(forGrowth: 500)
growBy500()
growBy500()
growBy500()
currentPopulation += growBy500()

// Closures are reference types
let anotherGrowBy500 = growBy500
anotherGrowBy500()

var someOtherPopulation = 4061981
let growBy10000 = makeGrowthTracker(forGrowth: 10000)
someOtherPopulation += growBy10000()
currentPopulation

// Higher-order functions
/*
take at least one function as an input
*/

// map(_:) - is function that your can use to transform an array's contents.
let precinctPopulations = [1244, 2021, 2157]

let projectedPopulations1 = precinctPopulations.map {
    (population: Int) -> Int in
    
    return population * 2
}

let projectedPopulations2 = precinctPopulations.map {
    (population)  in
    
    population * 2
}

let projectedPopulations = precinctPopulations.map {$0 * 2}
projectedPopulations

// filter(_:) - filter the array based on some criteria
let bigProjections = projectedPopulations.filter {
    (projection: Int) -> Bool in
    return projection > 4000
}

let bigProjections2 = projectedPopulations.filter {
    (projection)  in
    
    projection > 4000
}

let bigProjections3 = projectedPopulations.filter {$0 > 4000}
bigProjections3

// reduce(_:combine:) - reduce the values in the collection to a single value that is returned from the function
let totalProjection = projectedPopulations.reduce(0) {
    (accumulatedProjection: Int, precinctProjection: Int) -> Int in
    
    return accumulatedProjection + precinctProjection
}
totalProjection

let totalProjection2 = projectedPopulations.reduce(0) {
    (accumulatedProjection, precinctProjection) in
    
     accumulatedProjection + precinctProjection
}
totalProjection2

// Challenge
let totalProjection3 = projectedPopulations.reduce(0) {$0 + $1}
totalProjection3














































