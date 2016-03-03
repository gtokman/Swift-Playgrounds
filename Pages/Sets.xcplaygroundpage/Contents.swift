import Cocoa

// Sets

//var groceryBag = Set(["Apple", "Orange", "Banana"])
var groceryBag: Set = ["Apples", "Oranges", "Pineapple"]

//groceryBag.insert("Apples")
//groceryBag.insert("Banana")
//groceryBag.insert("Orange")

for food in groceryBag {
    print(food)
}

let hasBananas = groceryBag.contains("Banana")

// Unions // adds minus duplicates
let friendsGroceryBag = Set(["Cereal", "Milk", "Oranges", "Bananas"])
let commonGroceryBag = groceryBag.union(friendsGroceryBag)

// Intersects // returns items present in both
let roommatesGroceryBag = Set(["Apples", "Bananas", "Cereal", "Toothpaste"])
let itemsToReturn = commonGroceryBag.intersect(roommatesGroceryBag)

// Disjoint // Bool is nothing is repeated
let yourSecondBag: Set = ["Berries", "Yogurt"]
let roommatesSecondBag: Set = ["Grapes", "Honey"]
let disjoint = yourSecondBag.isDisjointWith(roommatesSecondBag)

// Challenge
let myCities: Set = ["Atlanta", "Chicago"]
let yourCities: Set = ["Chicago", "Jacksonville"]
myCities.elementsEqual(yourCities)
