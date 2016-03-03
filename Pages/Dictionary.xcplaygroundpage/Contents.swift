import Cocoa

// Dictionaries

var dict1: Dictionary<String, Double> = [:]
var dict2 = Dictionary<String, Double>()
var dict3: [String: Double] = [:]
var dict4 = [String: Double]()

// Populating a Dictionary
var movieRatings = ["Donnie Darko": 4, "Chungking Express": 5, "Dark City": 4]
print("I have rated \(movieRatings.count) movies.")
let darkoRating = movieRatings["Donnie Darko"]
movieRatings["Dark City"] = 5
movieRatings

// Update value
let oldRating: Int? = movieRatings.updateValue(5, forKey: "Donnie Darko")
if let lastRating = oldRating, currentRating = movieRatings["Donnie Darko"] {
    print("Old rating: \(lastRating); current rating: \(currentRating)")
}

// Add a value 
movieRatings["The Cabinet of Dr. Califagi"] = 5
//movieRatings.removeValueForKey("Dark City")
movieRatings["Dark City"] = nil


// Add to array
let watchedMovies = Array(movieRatings.keys)


// Looping
for (key, value) in movieRatings{
    print("The movie \(key) was rated \(value).")
}

// Keys only
for movie in movieRatings.keys {
    print("User has rated \(movie)")
}

// Immutable dictionaries
let album = [

    "Diet Roast Beef": 268,
    "Dubba Dubbs Stubs His Toe": 467,
    "Smokey's Carpet Cleaning Service": 187,
    "Track 4": 221

]

// Challenge
var counties = [

    "Orange": [03877, 04432, 99033],
    "Red": [23223, 32232, 23231],
    "Yellow": [32233, 32131, 31137]

]












