//: Playground - noun: a place where people can play

import UIKit

var str = "Hello, playground"

var myVariable = 40
myVariable = 58

let myConstant = 32

let implicitInteger = 30
let implicitDouble = 30.0
let explicitDouble:Double = 30
let explicitFloat:Float = 4

let label = "The width is "
let width = 94
let widthLabel = label + String(width)

let apples = 3
let oranges = 5
let appleSummary = "I have \(apples) apples."
let fruitSummary = "I have \(apples+oranges) fruits."

let floatPoint1: Float = 4
let floatPoint2: Float = 1
let floatPointCalc = "Sum = \(floatPoint1+floatPoint2)"

var shoppingList = ["catfish","water","tulips","bluepaint"]
shoppingList[1] = "bottle of water"

var occupations = [
    "Malcolm":"Captain",
    "Kaylee":"Mechanic",
]

occupations["Jaine"] = "Public Relations"
let emptyArray = [String]()
let emptyDictionary = [String: Float]()

shoppingList = []
occupations = [:]

let individualScores = [75, 43, 103, 87, 12]
var teamScore = 0
for score in individualScores{
    if score>50{
        teamScore+=3
    }else{
        teamScore+=1
    }
}
print(teamScore)

