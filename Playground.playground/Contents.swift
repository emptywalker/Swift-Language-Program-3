//: Playground - noun: a place where people can play

import UIKit


let finalSquare = 25
var borad = [Int](repeating: 0, count: finalSquare + 1)
borad[03] = +08
borad[06] = +09
borad[09] = +11
borad[10] = +02

borad[14] = -10
borad[19] = -11
borad[22] = -02
borad[24] = -08

var square = 0
var diceRoll = 0
//正常版本
//while square < finalSquare {
//    //掷骰子
//    diceRoll += 1
//    if diceRoll == 7 {
//        diceRoll = 1
//    }
//    //根据点数移动
//    square += diceRoll
//    if square < borad.count {
//        //如果玩家还在棋盘上，顺着梯子爬上去或者顺着蛇爬上去
//        //print(borad[square])
//        square += borad[square]
//        //print(square)
//    }
//}

//标签版本
gameLoop: while square != finalSquare{
    diceRoll += 1
    if diceRoll > 7 {
        diceRoll = 1
    }
    square += diceRoll
    switch square {
    case finalSquare:
        break gameLoop
    case let newSquare where newSquare > finalSquare :
        continue gameLoop
    default:
        square += borad[square]
    }
}
print("Game Over!")

let approximateCount = 62
let countedThings = "moons orbiting Staturn"
var naturalCount: String
switch approximateCount {
case 0:
    naturalCount = "no"
case 1 ..< 5:
    naturalCount = "a few"
case 5 ..< 12:
    naturalCount = "several"
case 12 ..< 100:
    naturalCount = "dozens of"
case 100 ..< 1000:
    naturalCount = "hundreds of"
default:
    naturalCount = "many"
}
print("There are \(naturalCount) \(countedThings)")

let somePoint = (3, 1)
switch somePoint {
case (0, 0):
    print("(0, 0) is at the origin.")
case (_, 0):
    print("(\(somePoint.0), 0) is on the x-axis.")
case (0, _):
    print("(0, \(somePoint.1)) is on the y-axis.")
case (-2 ... 2, -2 ... 2):
    print("(\(somePoint.0), \(somePoint.1)) is inside of the box.")
default:
    print("(\(somePoint.0), \(somePoint.1)) is outside of the box.")
}

let anotherPoint = (0, 2)
switch anotherPoint {
case (let x, 0):
    print("on the x-axis with an x value of \(x)")
case (0, let y):
    print("on the y-axis with a y value of \(y)")
case var (x, y):
    print("somewhere else at (\(x), \(y))")

}

let yetAnotherPoint = (-1, 1)
switch yetAnotherPoint {
case let (x, y) where x == y:
    print("(\(x), \(y)) is on the line x == y")
case let (x, y) where x == -y:
    print("(\(x), \(y)) is on the line x == -y")
case let (x, y):
    print("(\(x), \(y)) is just some arbitrary point")
}


let puzzleInput = "great minds think alike"
var puzzleOut = ""
for character in puzzleInput.characters {
    switch character {
    case "a", "e", "i", "o", "u", " ":
        continue
    default:
        puzzleOut.append(character)
    }
}
puzzleOut


let integerToDescribe = 5
var description = "The number \(integerToDescribe) is "
switch integerToDescribe {
case 2, 3, 5, 7, 11, 13, 17, 19:
    description += "a prime number, and also "
    fallthrough
default:
    description += "an integer."
}
description

//let name = "hello1"
func name(_ name: String){
    guard "hello" == name else {
        return
    }
    print(name)
}

print("\(name("hello"))")





//函数部分
func minMax(array: [Int]) -> (min: Int, max: Int)?{
    if array.isEmpty{ return nil }
    var minValue = array[0]
    var maxValue = array[0]
    for value in array[1 ..< array.count] {
        if value < minValue {
            minValue = value
        }else if value > maxValue{
            maxValue = value
        }
    }
    return (minValue, maxValue)
}
let bounds = minMax(array: [])
if let bounds = minMax(array: [-9,29,40]){
    bounds.min
    bounds.max
}

func someFunction(_ firstParamterName: Int, secondParamterName: Int){
    print(firstParamterName + secondParamterName, terminator:"\n")
}
someFunction(100, secondParamterName: 300)

func someDefaultParamterFunction(paramterWithoutDefault: Int, paramterWithDefault: Int = 20){
    print(paramterWithoutDefault, paramterWithDefault)
}
someDefaultParamterFunction(paramterWithoutDefault: 200, paramterWithDefault: 40)
someDefaultParamterFunction(paramterWithoutDefault: 300)

func arithemmeticMean(numbers: Double..., count: Double) -> Double{
    var total: Double = 0
    for value in numbers {
        total += value
    }
    return total / count
}

arithemmeticMean(numbers: 2.0, 5.5, 9.8, 4.4, 3.3, 99.9, count: 100.0)

func swapTwoInts(_ a: inout Int, _ b: inout Int){
    let temporary = a;
    a = b
    b = temporary
}
var someInt = 3
var anotherInt = 8
swap(&someInt, &anotherInt)
someInt
anotherInt


//函数类型 = 参数类型 + 返回值类型
func addTwoInts(_ a: Int, _ b: Int) -> Int{
    return a + b
}
func multiplyTwoInts(_ a: Int, _ b: Int) -> Int{
    return a * b
}

let mathFunction: (Int, Int) -> Int = multiplyTwoInts
mathFunction(10, 20)
let anotherMathFunction = addTwoInts
anotherMathFunction(200, 9)

func printerMathFunction(_ printerMath: (Int, Int) -> Int, _ a: Int, _ b: Int){
    print("printer result is \(printerMath(a, b))")
}
printerMathFunction(mathFunction, 300, 4000)



func chooseStepFunction(backward: Bool) -> (Int) -> Int{
    
    func stepForward(_ input: Int) -> Int{ return input + 1 }
    func stepBackward(_ input: Int) -> Int{ return input - 1 }
    return backward ? stepBackward : stepForward
}

var currentValue = -4
let moveNearerToZero = chooseStepFunction(backward: currentValue > 0)

while currentValue != 0 {
    print("\(currentValue) ...")
    currentValue = moveNearerToZero(currentValue)
}

//Closures (闭包)
let names = ["Chris", "Alex", "Ewa", "Barry", "Danielle"]
func backward(_ s1: String, _ s2: String) -> Bool{
//    print(s1 + " " + s2)
    return s1 > s2
}
var reversedNames = names.sorted(by: backward)
reversedNames
reversedNames = names.sorted(by: {(s0: String, s1: String) -> Bool in return s0 > s1})
reversedNames
reversedNames = names.sorted(by: {s1, s2 in s1 > s2})
reversedNames
reversedNames = names.sorted(by: {$0 > $1})
reversedNames
reversedNames = names.sorted(by: > )
reversedNames
reversedNames = names.sorted(){$0 > $1}
reversedNames
reversedNames = names.sorted {$0 > $1}
reversedNames

let digitNames = [
    0: "Zero", 1: "One", 2: "Two",   3: "Three", 4: "Four",
    5: "Five", 6: "Six", 7: "Seven", 8: "Eight", 9: "Nine"
]
let numbers = [16, 58, 510]
let strings = numbers.map { (number) -> String in
    var number = number
    var output = ""
    repeat{
        output = digitNames[number % 10]! + output
        number /= 10
    }while number > 0
    return output
}
strings


func makeIncrementor(increment count: Int) -> () -> Int{
    var totalCount = 0
    func incrementor() -> Int{
        totalCount += count
        return totalCount
    }
    return incrementor
}

let incrementor = makeIncrementor(increment: 50)
incrementor()
incrementor()
incrementor()
incrementor()
let incrementorByHunrdred = makeIncrementor(increment: 100)
incrementorByHunrdred()
incrementorByHunrdred()


//逃逸闭包
var completionHandlers: [() -> Void] = []
func someFunctionWithEscapingClosure(completionHandler: @escaping () -> Void){
    completionHandlers.append(completionHandler)
}

func someFunctionWithNoneEscapingClosure(closure: () -> Void){
    closure()
}

class SomeClass{
    var x = 10
    func doSomething() {
        someFunctionWithEscapingClosure {
            self.x = 100
        }
        someFunctionWithNoneEscapingClosure {
            x = 20
        }
    }
}

let instance = SomeClass()
instance.doSomething()
instance.x
completionHandlers.first?()
instance.x




