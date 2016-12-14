//: Playground - noun: a place where people can play

import UIKit

var str = "Hello, playground"
print("hello world")
let myFloat: Float = 70

let label = "The width is "
let width = 94
let widthLabel = label + String(width)

let apple = 3
let orange = 5
let appleSummary = "I have \(apple) apples"
let fruitSummary = "I have \(apple + orange) pieces of fruits"

var shoppingList = ["catfish", "water", "tulips", "blue paint"]
shoppingList[1] = "bottle of water"
//print(shoppingList)

var occupations = [
    "Malcolm": "Captain",
    "Kaylee": "Mechanic",
]
//print(occupations)
occupations["Kaylee"] = "Public Relation"
//print(occupations)

let  emptyArray = [String]()
let emptyDictionary = [String: Float]()


let individualScores = [75, 43, 103, 87, 12]
var teamScore = 0
for score in individualScores {
    if score > 50 {
        teamScore += 3
    }else{
        teamScore += 1
    }
}
print(teamScore)

var optinalString: String? = "hello"
print(optinalString == nil)

var optionalName: String? = nil//"John Appleseed"
var greeting = "hello"
if let name = optionalName {
    greeting = "Hello, \(name)"
}else{
    greeting = "Hello SB"
}
print(greeting)
let naem = optionalName



let nickName: String? = nil
let fullName: String = "John Appleseed"
let informalGreeting = "Hi \(nickName ?? "xuyouhong")"


let vegetable = "red pepper"
switch vegetable {
case "celery":
    print("Add some raisins and make ants on a log.")
case "cucumber", "watercress":
    print("That would make a good tea sandwich")
case let x where x.hasSuffix("pepper"):
    print("Is it a spixy \(x)")
default:
    print("Everything tastes good in soup")
}


let interestingNumbders = [
    "Prime": [2, 3, 5, 7, 11, 13],
    "Fibonacci": [1, 1, 2, 3, 55, 8],
    "Square": [1, 4, 9, 16, 25],
]
var largest = 0
var largestKind: String = ""

for (kind, numbers) in interestingNumbders {
    for number in numbers {
        if number > largest {
            largest = number
            largestKind = kind;
        }
    }
}
print(largestKind + " " + String(largest))


var n = 2
while n < 100 {
    n = n * 2
}
//print(n)

var m = 2
repeat {
    m = m * 2
} while m < 100
//print(m)

var total = 0
for i in 0...4{
    total += i
}
//print(total)

func greet(_ person: String, sb lunch: String) -> String{
    return "Hello \(person), lunch eat \(lunch)"
}
print(greet("Bob", sb: "braised chicken"))



func calculateStatistics(scores: [Int]) -> (min: Int, max: Int, sum: Int) {
    var min = scores[0]
    var max = scores[0]
    var sum = 0
    
    for score in scores {
        if score > max {
            max = score
        }else if score < min {
            min = score
        }
        sum += score
    }
    return (min, max, sum)
}
let statistics = calculateStatistics(scores: [12, 342, 5425, 1231])
//print(statistics.max)
//print(statistics.2)

func sumOf(numbers: Float ...) -> Float {
    var sum: Float = 0
    for number: Float in numbers {
        sum += number
    }
    let count: Float = Float(numbers.count);
    let avg: Float = sum/count
    
    return avg
}
sumOf()
sumOf(numbers: 1,2,3,4,5,5)

func returnFifteen() -> Int{
    var y = 10
    func add() {
        y += 5
    }
    add()
    return y
}
returnFifteen()

func makeIncrementer() -> ((Int) -> Int) {
    func addTwo(number: Int) -> Int {
        return number + 2
    }
    return addTwo
}
var increment = makeIncrementer()
increment(10)


func hasAnyMatches(list: [Int], condition: (Int) -> Bool) -> Bool {
    for item in list {
        if condition(item) {
            //print("------- \(item)")
            return true
        }else{
            //print(" ======== \(item)")
        }
    }
    return false
}

func lessThanTen(number: Int) -> Bool {
    return number < 10
}
var numbers = [20, 19, 7, 12]
hasAnyMatches(list: numbers, condition: lessThanTen)

numbers.map({
    (number: Int) -> Int in
    if number % 2 == 1 {
        return 0
    }
    return number
})

let mappedNumbers = numbers.map({ number in 3 * number})
print(mappedNumbers)

let sortedNumbers = numbers.sorted {$0 < $1}
print(sortedNumbers)



class Shape{
    var numberOfSides = 0
    let constant = 100
    
    func simpleDescription() -> String {
        return "A shape with \(numberOfSides) sides."
    }
    
    func anumber(number: Int) -> Int {
        return number
    }
}
var shape = Shape()
shape.numberOfSides = 100
//shape.constant = 10
var shapeDescription = shape.simpleDescription()

class NameShape {
    var numberOfSides: Int = 0
    var name: String
    
    init(name: String) {
        self.name = name
    }
    
    func simpleDescription() -> String {
        return "A shape with \(numberOfSides) sides."
    }
}

class Square: NameShape {
    var sideLength: Double
    init(sideLength: Double, name: String) {
        self.sideLength = sideLength
        super.init(name: name)
        numberOfSides = 4
    }
    
    func area() -> Double {
        return sideLength * sideLength
    }
    
    override func simpleDescription() -> String {
        return "A square with sides of length \(sideLength)."
    }
}
let test = Square(sideLength: 5.2, name: "my test square")
test.area()
test.simpleDescription()


class EquilateralTriangle: NameShape {
    var sideLength: Double = 0.0
    
    init(sideLength: Double, name: String) {
        self.sideLength = sideLength
        super.init(name: name)
        numberOfSides = 3
    }
    var permeter: Double {
        get {
            return 3.0 * sideLength
        }
        set {
            sideLength = newValue / 3.0
        }
    }
    
    override func simpleDescription() -> String {
        return "An equilateral triangle with sides of length \(sideLength)."
    }
}
var triangle = EquilateralTriangle(sideLength: 3.1, name: "a triangle")
print(triangle.permeter)
triangle.permeter = 9.9
print(triangle.sideLength)

class TriangleAndSquare {
    var triangle: EquilateralTriangle{
        willSet{
            print("-----")
            square.sideLength = newValue.sideLength
        }
    }
    var square: Square {
        willSet{
            print("++++++")
            triangle.sideLength = newValue.sideLength
        }
    }
    init(size: Double, name: String) {
        square = Square(sideLength: size, name: name)
        triangle = EquilateralTriangle(sideLength: size, name: name)
    }
}
var triangleAndSquare = TriangleAndSquare(size: 10, name: "another test shape")
print(triangleAndSquare.triangle.sideLength)
print(triangleAndSquare.square.sideLength)
triangleAndSquare.triangle = EquilateralTriangle(sideLength:50, name:"large square")
print(triangleAndSquare.square.sideLength)

//可选值
let optionalSquare: Square? = Square(sideLength: 0, name: "optional square")
let sideLength = optionalSquare?.sideLength

//枚举
enum Rank: Int {
    case Ace = 1
    case Two, Three, Four, Five, Six, Seven, Eight, Nine, Ten
    case Jack, Queen, King
    func simpleDescription() -> String {
        switch self {
        case .Ace:
            return "Ace"
        case .Jack:
            return "Jack"
        case .King:
            return "King"
        case .Queen:
            return "Queen"
        case .Three:
            return "are you SB"
        default:
            return String(self.rawValue)
        }
    }
}
let ace = Rank.Ace
let aceRawValue = ace.rawValue

let five: Rank = .Five
let four: Rank = .Four
//task
func rankRawValue(firstRank: Rank, secondRank: Rank) -> Bool{
    print(firstRank.rawValue   , secondRank.rawValue)
    return firstRank.rawValue == secondRank.rawValue
}
rankRawValue(firstRank: five, secondRank: four)


if let convertedRank = Rank(rawValue: 3) {
    let threeDescription = convertedRank.simpleDescription()
}

enum Suit {
    case Spades, Hearts, Diamonds, Clubs
    func simpleDescription() -> String {
        switch self {
        case .Spades:
            return "spades"
        case .Hearts:
            return "hearts"
        case .Diamonds:
            return "diamonds"
        case .Clubs:
            return "clubs"
        }
    }
    //task
    func color() -> String {
        switch self {
        case .Spades:
            return "black"
        case .Hearts:
            return "black"
        case .Diamonds:
            return "red"
        case .Clubs:
            return "red"
        }
    }
}
let hearts: Suit = .Hearts
let heartsDescription = hearts.simpleDescription()
hearts.color()
let diamonds = Suit.Diamonds.simpleDescription()
Suit.Diamonds.color()


enum ServerResponse {
    case Result(String, String)
    case Failure(String)
}
let success = ServerResponse.Result("6:00 am", "8:09 pm")
let failure = ServerResponse.Failure("Out of cheese")

switch failure {
case let .Result(sunrise, sunset):
    let serverSponse = "Sunrise is at \(sunrise) and sunset is at \(sunset)"
case let .Failure(message):
    print("Failure... \(message)")
}

//结构体
struct Card {
    var rank: Rank
    var suit: Suit
    func simpleSescription() -> String {
        return "The \(rank.simpleDescription()) of \(suit.simpleDescription()))"
    }
}
let threeOfSpades = Card(rank: .Three, suit: .Spades)
threeOfSpades.simpleSescription()

//协议和扩展
protocol ExampleProtocol {
    var simpleDescription: String {
        get
    }
    mutating func adjust()
}
class SimpleClass: ExampleProtocol {
    var simpleDescription: String = "A very simple class."
    var anotherProperty: Int = 69105
    func adjust() {
        simpleDescription += "  Now 100% adjusted."
    }
}
var a = SimpleClass()
a.adjust()
a.simpleDescription


extension Int: ExampleProtocol {
    var simpleDescription: String {
        return "The number \(self)"
    }
    mutating func adjust() {
        self += 42
    }
}
print(7.simpleDescription)
var intValue = 7
intValue.adjust()

let protocolValue: ExampleProtocol = a
print(protocolValue.simpleDescription)
 //print(protocolValue.anotherProperty)


//错误
enum PrinterError: Error {
    case outOfPaper
    case noToner
    case onFire
}

func send(job: Int, toPrinterName printerName: String) throws -> String {
    if printerName == "Never Has Toner" {
        throw PrinterError.noToner
    }else if printerName == "Never Has onFire"{
        throw PrinterError.onFire
    }else if printerName == "Never Has outOfPaper"{
        throw PrinterError.outOfPaper
    }
    return "Job sent"
}


do {
    let printerResponse = try send(job: 32, toPrinterName: "Never Has onFire1")
    print(printerResponse)
} catch PrinterError.onFire{
    print("I'll jsut put this over here, with the rest of the fire.")
} catch let printerError as PrinterError{
    print("PrinterError error : \(printerError)")
} catch {
    print(error)
}


let printerSuccess = try? send(job: 1884, toPrinterName: "Mergenthaler")
let printerFailure = try? send(job: 1885, toPrinterName: "Never Has Toner")

var fridgeIsOpen = false
let fridgeContent = ["milk", "eggs", "leftovers"]
func fridgeContains(_ food: String) -> Bool {
    fridgeIsOpen = true
    defer {
        fridgeIsOpen = false
    }
    let result = fridgeContent.contains(food)
    return result
}
fridgeContains("eggs")
print(fridgeIsOpen)


//泛型 generic
func repeatItem <Item> (repeating item: Item, numberOfTimes: Int) -> [Item] {
    var result = [Item]()
    for _ in 0 ..< numberOfTimes {
        result.append(item)
    }
    return result
}
repeatItem(repeating: "konck", numberOfTimes: 4)

//重新实现 Swift 标准库中的可选类型
enum OptionalValue<Wrapped> {
    case None
    case Some(Wrapped)
}
var possibleInteger: OptionalValue<String> = .None
possibleInteger = .Some("100")


func anyCommonElements<T: Sequence, U:Sequence>(_ lhs: T, _ rhs: U) -> Bool where T.Iterator.Element: Equatable, T.Iterator.Element == U.Iterator.Element {
    for lhsItem in lhs{
        for rhsItem in rhs {
            if lhsItem == rhsItem {
                return true
            }
        }
    }
    return false
}
anyCommonElements([1, 2, 3], [28])








































