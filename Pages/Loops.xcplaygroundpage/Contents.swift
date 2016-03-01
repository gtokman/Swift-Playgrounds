// Loops
import Cocoa

var myFirstInt: Int = 0

for var i = 1; i < 6; ++i {
++myFirstInt
    //print(myFirstInt)
}

// for case
for case let i in 1...100 where i % 3 == 0 {
    //print(i)
}

// While Loop
var i = 1
while i < 6 {
    ++myFirstInt
   // print(myFirstInt)
    ++i
}

// Control transfer
var shields = 5
var blasterOverheating = false
var blasterFireCount = 0
var spaceDemonsDestroyed = 0

//while shields > 0 {
//    
//    if spaceDemonsDestroyed == 200 {
//        print("You beat the game!")
//        break
//    }
//    
//    if blasterOverheating {
//        print("Blasters are overheated! Cooldown initiated.")
//        sleep(5)
//        print("Blasters ready to fire")
//        sleep(1)
//        blasterOverheating = false
//        blasterFireCount = 0
//    }
//    
//    if blasterFireCount > 100 {
//        blasterOverheating = true
//        continue
//    }
//    
//    // Fire blaster!
//    print("Fire blasters!")
//    
//    ++blasterFireCount
//    ++spaceDemonsDestroyed
//    
//}

// Challenge
for i in 0...98 where i % 2 == 0{
    print("\(i + 2)")
}













