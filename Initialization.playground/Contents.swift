//: Playground - noun: a place where people can play

import UIKit

struct Fahrenhait {
    var temperature: Double
    init() {
        temperature = 32.0
    }
}
let f = Fahrenhait()
f.temperature

struct Celsius {
    var temperatureInCelsius: Double
    init(formFahrenheit fahrenheit: Double) {
        temperatureInCelsius = (fahrenheit - 32.0) / 1.8
    }
    init(fromKelvin kelvin: Double) {
        temperatureInCelsius = kelvin - 273.15
    }
}

let boillingPointOfWater = Celsius(formFahrenheit: 212.0)
boillingPointOfWater.temperatureInCelsius
let freezingPointOfWater = Celsius(fromKelvin: 273.15)
freezingPointOfWater.temperatureInCelsius

struct Color {
    let red, green, blue: Double
    init(red: Double, green: Double, blue: Double) {
        self.red = red
        self.green = green
        self.blue = blue
    }
    init(_ white: Double) {
        red = white
        green = white
        blue = white
    }
}
let magenta = Color(red: 1.0, green: 0.0, blue: 1.0)
let halfGray = Color(0.5)


class SurveyQuestion {
    var text: String
    var response: String?
    init(text: String) {
        self.text = text
    }
    func ask() -> Void {
        print(text)
    }
}
let cheeseQuestion = SurveyQuestion(text: "Do you like cheese?")
cheeseQuestion.ask()
cheeseQuestion.response = "Yes, I do like cheese."


class ShoppingItem {
    var name: String?
    var quantity = 0
    var purchased = false
}
let item = ShoppingItem()
//let item2 = ShoppingListIte

struct Size {
    var width = 0.0, height = 0.0
}
let twoByTwo = Size(width: 2.0, height: 2.0)

struct Point {
    var x = 0.0, y = 0.0
}
struct Rect {
    var origin = Point()
    var size = Size()
    init() { }
    init(origin: Point, size: Size) {
        self.origin = origin
        self.size = size
    }
    init(center: Point, size: Size) {
        let originX = center.x - (size.width / 2.0)
        let originY = center.y - (size.height / 2.0)
        self.init(origin: Point(x: originX, y: originY), size: size)
    }
}
let basicRect = Rect()
basicRect.origin.y
basicRect.size.width


class Vehicle {
    var numberOfWheels = 0
    var description: String {
        return "\(numberOfWheels) whell(s)."
    }
}
let vehicle = Vehicle()
vehicle.description

class Bicycle: Vehicle {
    var hasBasket: Bool
    override init() {
        hasBasket = true
        super.init()
        numberOfWheels = 2
        
    }
}
let bicycle = Bicycle()
bicycle.description


class Food {
    var name: String
    init(name: String) {
        self.name = name
    }
    convenience init() {
        self.init(name: "[Unnamed]")
    }
}
let nameMeat = Food(name: "Bacon")
nameMeat.name
let unnamed = Food()
unnamed.name

class RecipeIngredient: Food {
    var quantity: Int
    init(name: String, quantity: Int) {
        self.quantity = quantity
        super.init(name: name)
    }
    override convenience init(name: String) {
        self.init(name: name, quantity: 1)
    }
}
let oneMysteryMeat = RecipeIngredient()
oneMysteryMeat.name
let oneBacon = RecipeIngredient.init(name: "Bacon", quantity: 5)
oneBacon.name
oneBacon.quantity
let egg = RecipeIngredient(name: "egg")
egg.name
egg.quantity


class ShoppingListItem: RecipeIngredient {
    var purchased = false
    var description: String {
        var output = "\(quantity) X \(name)"
        output += purchased ? " ✔" : " ✘"
        return output
    }
}
var breakfastList = [
    ShoppingListItem(),
    ShoppingListItem(name: "Bacon"),
    ShoppingListItem(name: "Eggs", quantity: 6)
]
breakfastList[0].name = "Orange juice"
breakfastList[0].purchased = true
for item in breakfastList {
    print(item.description)
}


struct Animal {
    let species: String
    init?(species: String) {
        if species.isEmpty { return nil }
        self.species = species
    }
}
let animal = Animal(species: "123")
animal?.species


class Product {
    var name: String
    init?(name: String) {
        if name.isEmpty { return nil }
        self.name = name
    }
}

class CartItem: Product {
    let quantity: Int
    init?(name: String, quantity: Int) {
        if quantity < 1 { return nil }
        self.quantity = quantity
        super.init(name: name)
    }
}

if let twoSocks = CartItem(name: "sock", quantity: 2) {
    print("Item: \(twoSocks.name), quantity: \(twoSocks.quantity)")
}

class Docunment {
    var name: String?
    init() { }
    init?(name: String) {
        self.name = name
        if name.isEmpty {
            return nil
        }
    }
}









