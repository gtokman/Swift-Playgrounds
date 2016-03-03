import Cocoa

// Arrays

//var bucketList: Array <String>
var bucketList = ["Climb Mt. Everest"]

// Modifiy Array

//bucketList.append("Fly hot air ballon to Fiji")
//bucketList.append("Live in Costa Rica")
//bucketList.append("Meet the president")
//bucketList.append("Visit Australia")
//bucketList.append("Drive a Ferrari in Italy")

var newItems = [
    "Fly hot air ballon to Fiji",
    "Live in Costa Rica",
    "Meet the president",
    "Visit Australia",
    "Drive a Ferrari in Italy"
]

bucketList += newItems

bucketList.removeAtIndex(2)
print(bucketList.count)
print(bucketList[0...2])
bucketList[2] += " of the USA"
bucketList[0] = "Climb Mt. Kilimanjaro"
//bucketList.insert("Toboggan across Alask", atIndex: 1)
bucketList


var myronsList = [
    "Climb Mt. Kilimanjaro",
    "Fly hot air ballon to Fiji",
    //"Live in Costa Rica",
    "Meet the president of the USA",
    "Visit Australia",
    "Drive a Ferrari in Italy"
]

let equal = (bucketList == myronsList)

// Immutable array

let lunches = [

    "Cheeseburger",
    "Veggie Pizza",
    "Chicken Caesar Salad",
    "Black Bean Burrito",
    "Falafel Wrap"
    
]

// Challenge

var toDoList = ["Take out trash", "Pay bills", "Cross off finished items"]
toDoList.isEmpty

for (index, value) in toDoList.reverse().enumerate() {
    print(index)
    print(value)
}

toDoList = toDoList.reverse()
print(toDoList)






























