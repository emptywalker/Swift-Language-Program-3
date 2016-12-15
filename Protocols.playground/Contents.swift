//: Playground - noun: a place where people can play

import UIKit

protocol SomeProtocol {
    var mustBeSettable: Int { set get }
    var doesNotNeedToBeSettable: Int { get }
    init(someParameter: Int)
}



protocol AnotherProtocol {
    static var someTypeProperty: Int { get set }
}

protocol FullyName {
    var fullName: String { get }
}

struct Person: FullyName {
    var fullName: String

}
let john = Person(fullName: "John Appleseed")
john.fullName

class Starship: FullyName {
    var prefix: String?
    var name: String
    init(name: String, prefix: String? = nil) {
        self.name = name
        self.prefix = prefix
    }
    var fullName: String {
        return (prefix != nil ? (prefix! + " ") : "") + name
    }
}
var ncc1701 = Starship(name: "Enterprise", prefix: "USS")
ncc1701.fullName


protocol RandomNumberGenerator {
    func random() -> Double
}

class LinearCongruentialGenerator: RandomNumberGenerator {
    var lastRandom = 42.3
    let m = 139968.0
    let a = 3877.0
    let c = 29573.0
    func random() -> Double {
        lastRandom = (lastRandom * a + c).truncatingRemainder(dividingBy: m)
        return lastRandom / m
    }
}
let generator = LinearCongruentialGenerator()
generator.random()
generator.random()

protocol Togglable {
    mutating func toggle()
}

enum OnOffSwitch: Togglable {
    case off, on
    mutating func toggle() {
        switch self {
        case .off:
            self = .on
        case .on:
            self = .off
        }
    }
}
var lightSwitch = OnOffSwitch.off
lightSwitch.toggle()

class Dice {
    let sides: Int
    let generator: RandomNumberGenerator
    init(sides: Int, generator: RandomNumberGenerator) {
        self.sides = sides
        self.generator = generator
    }
    
    func roll() -> Int {
        return Int(generator.random() * Double(sides)) + 1
    }
}

var v6 = Dice(sides: 6, generator: LinearCongruentialGenerator())
for _ in 1 ... 5 {
    print("Random dice roll is \(v6.roll())")
}

protocol TextRepresentable {
    var textualDescription: String { get }
}
extension Dice: TextRepresentable {
    var textualDescription: String {
        return "A \(sides)-sided dice"
    }
}
let v2 = Dice(sides: 2, generator: LinearCongruentialGenerator())
v2.textualDescription

struct Hamster {
    var name: String
    var textualDescription: String {
        return "A hamster named \(name)"
    }
}
extension Hamster: TextRepresentable {}

let simomTheHamster = Hamster(name: "Simon")
simomTheHamster.textualDescription

let somthingTextualRepresentable: TextRepresentable = simomTheHamster
somthingTextualRepresentable.textualDescription

protocol PrettyTextualRepresentable: TextRepresentable {

    var prettyTextualRepresentable: String { get }
}

protocol Named {
    var name: String { get }
}
protocol Aged {
    var age: Int { get }
}
struct Person1: Named, Aged {
    var name: String
    var age: Int
}
func wishHappyBirthday(to celebrator: Named & Aged){
    print(celebrator.name,  celebrator.age)
}
let birthdayPerson = Person1(name: "XYH", age: 24)
wishHappyBirthday(to: birthdayPerson)


protocol HasArea {
    var area: Double { get }
}
class Circle: HasArea {
    let pi = 3.1415926
    var radius: Double
    var area: Double { return pi * radius * radius}
    init(radius: Double) {
        self.radius = radius
    }
}
class Country: HasArea {
    var area: Double
    init(area: Double) {
        self.area = area
    }
}
class Animal {
    var legs: Int
    init(legs: Int) {
        self.legs = legs
    }
}
let objects: [AnyObject] = [
    Circle(radius: 30),
    Country(area: 234234134),
    Animal(legs: 300)
]
for object in objects {
    if let objectWithArea = object as? HasArea {
        print("Area is \(objectWithArea.area)")
    } else {
        print("Something that doesn't have an area")
    }
}

@objc protocol CounterDataSource {
    @objc optional func incrementForCounter(forCount count: Int) -> Int
    @objc optional var fixedIncrement: Int { get }
}

class Counter {
    var count = 0
    var dataSource: CounterDataSource?
    func increment() {
        if let amount = dataSource?.incrementForCounter?(forCount: count) {
            count += amount
        }else if let amount = dataSource?.fixedIncrement {
            count += amount
        }
    }
}
class ThreeSource: NSObject, CounterDataSource {
    let fixedIncrement: Int = 3
}
let counter = Counter()
counter.dataSource = ThreeSource()
for _ in 1...4 {
    counter.increment()
    print(counter.count)
}

@objc class TowardsToZeroSource: NSObject, CounterDataSource {
    func incrementForCounter(forCount count: Int) -> Int {
        if count == 0 {
            return 0
        } else if count < 1 {
            return 1
        } else {
            return -1
        }
    }
}
counter.count = -4
counter.dataSource = TowardsToZeroSource()
for _ in 1...5 {
    counter.increment()
    print("counter's count is \(counter.count)")
}

extension RandomNumberGenerator {
    func randomBool() -> Bool {
        return random() > 0.5
    }
}
let random = LinearCongruentialGenerator()
random.random()
random.randomBool()

extension PrettyTextualRepresentable {
    var prettyTextualDescription: String {
        return textualDescription
    }
}


























