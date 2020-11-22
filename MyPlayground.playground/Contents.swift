import UIKit

var smallQueue = [ 11,22,33]

for _ in 1...50 {
    


// mix them small queue
let a = smallQueue[0]
let b = smallQueue[1]
let c = smallQueue[2]
var randomNumber = Int.random(in: 0...2)
smallQueue[randomNumber] = a
switch randomNumber {
case 0: // a is at position 0
    randomNumber = Int.random(in: 0...1)
    if randomNumber == 1 {
        smallQueue[1] = c
        smallQueue[2] = b
    }
case 1: // a is at position 1
    randomNumber = Int.random(in: 0...1)
    if randomNumber == 1 {
        smallQueue[0] = b
    } else {
        smallQueue[0] = c
        smallQueue[2] = b
    }
default : // a is at position 2
    randomNumber = Int.random(in: 0...1)
    if randomNumber == 1 {
        smallQueue[0] = c
    } else {
        smallQueue[0] = b
        smallQueue[1] = c
    }
}

print (smallQueue)
}

