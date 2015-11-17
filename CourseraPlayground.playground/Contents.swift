//: Playground - noun: a place where people can play

import UIKit

let constantString = "Hello"
var str = "Hello, playground"

//var optionalString : String? = "Play"
//optionalString = nil

print(str)
//print(optionalString)

//var counter = 0

for counter in 0..<10 {
    guard counter != 2 else { continue }
    if counter != 5 {
        print(counter)
    }
}

//Arrays
var animals = ["chickens", "cows", "ducks"]
animals[1] = "geese"
print(animals)

//Dictionaries or Hashtables
var cuteness = [
    "chickens": "somewhat",
    "ducks": "cute",
    "geese": "scary"
]

cuteness["ducks"]

for animal in animals{
    cuteness[animal]
}

//functions
func transmogrify(species:String) -> Int {
    switch species{
        case "duck": return 0
        case "human": return 1
        default: return -1
    }
}

transmogrify("duck")
transmogrify("human")
transmogrify("cows")

func indexOf(species: String, weight: Int = 0) -> Int{
    switch species{
        case "duck": return 0+weight
        case "human": return 100+weight
        default: return -100+weight
    }
}

indexOf("duck",weight: 10)
indexOf("human")
indexOf("cows")

//2D arrays
var image = [
    [3, 15, 3],
    [26, 3, 4],
    [14, 8, 22]
]

for i in 0..<image.count{
    for j in 0..<image[i].count{
        if image[i][j] < 5 {
            image[i][j] = 5
        }
    }
}

image

func raiseLowerNumbers(inout inImage image:[[Int]],to number:Int){
    for i in 0..<image.count{
        for j in 0..<image[i].count{
            if image[i][j] < number {
                image[i][j] = number
            }
        }
    }
}

raiseLowerNumbers(inImage: &image, to: 100)

//Optionals
var maybeString: String? = "hi"

if maybeString != nil{
    maybeString!.characters.count
}


if let definitelyString = maybeString{
    definitelyString.characters.count
}else{
    print("It's nil!")
}

//guard let string = maybeString else {return}
var mostLikelyString: String! = "hi"
mostLikelyString.characters.count

class CupHolder {
    var cups:[String]? = nil
}

class Car {
    var cupHolders:CupHolder? = nil
}

let niceCar = Car()
niceCar.cupHolders = CupHolder()

niceCar.cupHolders?.cups = ["Sprite"]
//if var cupHolder = niceCar.cupHolders{
//    if var cups = cupHolder.cups{
//        cups.append("Coke")
//    }else {
//        cupHolder.cups = ["Coke"]
//    }
//}
niceCar.cupHolders?.cups?[0] = "Coke"

if let cupHolder = niceCar.cupHolders{
    if let cups = cupHolder.cups {
        if(cups[0] == "Coke"){
            print("Yay")
        }else{
            print("Aww")
        }
    }
}

let firstCup = niceCar.cupHolders?.cups?[0]


//Closures
func performMagic(thingy: String) -> String {
    return thingy
}

performMagic("Hey")
var magicFunction = performMagic
magicFunction("Hey")

var newMagicFunction = {
    (thingy: String) -> String in
    return thingy
}

var adderFunction: (Int, Int) -> Int = {
    (a:Int, b:Int) -> Int in
    return a+b
}

adderFunction(1,3)

var b = 3
var addFunction: (Int) -> Int = {
    (a:Int) -> Int in
    return a+b
}
addFunction(1)
b = 2
addFunction(1)

//Properties
class Legs{
    var count: Int = 0
}

class Animal{
    var name: String = ""
    var legs: Legs? = Legs()
    
    var uppercaseName: String {
        get {
            return name.uppercaseString
        }
        set {
            name = newValue
        }
    }
}

class LegVet{
    weak var legs: Legs? = nil
}

let dog = Animal()
let vet = LegVet()
vet.legs = dog.legs

//Value types
var an = 3
var bn = an

bn = 5
an

//classes are copied by pointers
class number {
    var n : Int
    init(n:Int){
        self.n = n
    }
}

var anum = number(n: 3)
var bnum = anum

bnum.n = 5
bnum.n
anum.n

//structs are copied by values
struct number_s {
    var n : Int
    init(n:Int){
        self.n = n
    }
}


var anum_s = number_s(n: 3)
var bnum_s = anum_s

bnum_s.n = 5
bnum_s.n
anum_s.n



let im = UIImage(named: "sample")!
let rgbaImage = RGBAImage(image: im)!

//let x = 20
//let y = 20
//let index = y * rgbaImage.width + x
//var pixel = rgbaImage.pixels[index]

//pixel.red = 255
//pixel.green = 0
//pixel.blue = 0

//rgbaImage.pixels[index] = pixel
//let newImage = rgbaImage.toUIImage()!

var totalRed = 0
var totalGreen = 0
var totalBlue = 0

/*
for y in 0..<rgbaImage.height {
    for x in 0..<rgbaImage.width {
        let index = y * rgbaImage.width + x
        let pixel = rgbaImage.pixels[index]
        
        totalRed += Int(pixel.red)
        totalGreen += Int(pixel.green)
        totalBlue += Int(pixel.blue)
    }
} */

let pixelCount = rgbaImage.width * rgbaImage.height
let avgRed = 118    //totalRed / pixelCount
let avgGreen = 98   //totalGreen / pixelCount
let avgBlue = 83    //totalBlue / pixelCount
let sum = avgRed + avgGreen + avgBlue

/*
for y in 0..<rgbaImage.height {
    for x in 0..<rgbaImage.width {
        let index = y * rgbaImage.width + x
        var pixel = rgbaImage.pixels[index]
        
        if (Int(pixel.red) + Int(pixel.green) + Int(pixel.blue) < sum) {
            pixel.red = 0
            pixel.blue = 0
            pixel.green = 0
            rgbaImage.pixels[index] = pixel
        }
    }
}

let newImage = rgbaImage.toUIImage()! */


//Code to increase the contrast in the image
for y in 0..<rgbaImage.height {
    for x in 0..<rgbaImage.width {
        let index = y * rgbaImage.width + x
        var pixel = rgbaImage.pixels[index]
        
        let redDelta = Int(pixel.red) - avgRed
        let greenDelta = Int(pixel.green) - avgGreen
        let blueDelta = Int(pixel.blue) - avgBlue
        
        var modifier = 2
        if (Int(pixel.red) + Int(pixel.green) + Int(pixel.blue) < sum){
            modifier = 1
        }
        
        pixel.red = UInt8(max(min(255, avgRed + modifier * redDelta),0))
        pixel.blue = UInt8(max(min(255, avgBlue + modifier * blueDelta),0))
        pixel.green = UInt8(max(min(255, avgGreen + modifier * greenDelta),0))
        rgbaImage.pixels[index] = pixel
        
    }
}

im

let newImage = rgbaImage.toUIImage()!

