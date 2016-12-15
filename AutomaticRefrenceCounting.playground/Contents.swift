//: Playground - noun: a place where people can play

import UIKit

class Person {
    let name: String
    init(name: String) {
        self.name = name
        print("\(name) is being initialized.")
    }
    var apartment: Apartment?
    deinit {
        print("\(name) is being deinitialized.")
    }
}

//var refrence1: Person?
//var refrence2: Person?
//var refrence3: Person?
//refrence1 = Person(name: "Jhon Appleseed")
//refrence2 = refrence1
//refrence3 = refrence1
//
//refrence1 = nil
//refrence2 = nil
//refrence3 = nil

class Apartment {
    let unit: String
    init(unit: String) {
        self.unit = unit
        print("\(unit) is being initialized.")
    }
    weak var tenant: Person?
    deinit {
        print("Apartment \(unit) is being deinitialized.")
    }
}

var john: Person?
var unit4A: Apartment?
john = Person(name: "John Applseed")
unit4A = Apartment(unit: "4A")

john!.apartment = unit4A
unit4A!.tenant = john

unit4A = nil
//john = nil


class Customer {
    var name: String
    var card: CreditCard?
    init(name: String) {
        self.name = name
    }
    deinit {
        print("\(name) is being deintializaed")
    }
}
class CreditCard {
    let number: UInt64
    unowned let customer: Customer
    init(number: UInt64, customer: Customer) {
        self.number = number
        self.customer = customer
    }
    deinit {
        print("Card #\(number) is being deinitializaed.")
    }
}

//var appleseed: Customer?
//appleseed = Customer(name: "John Appleseed")
//appleseed?.card = CreditCard(number: 123_231_123_123_123_0, customer: appleseed!)
//appleseed = nil


class Country {
    let name: String
    var captialCity: City!
    init(name: String, captialName: String) {
        self.name = name
        captialCity = City(name: captialName, country: self)
    }
    deinit {
        print("Country \(name) is being deinitializaed.")
    }
    
}
class City {
    let name: String
    unowned let country: Country
    init(name: String, country: Country) {
        self.name = name
        self.country = country
    }
    deinit {
        print("City \(name) is being deinitializaed.")
    }
}
//var country = Country(name: "China", captialName: "Beijing")
//country.name
//country.captialCity.name
//country = nil

class HTMLElement {
    let name: String, text: String?
    
    lazy var asHTML: () -> String = {
        [unowned self] in
        if let text = self.text {
            return "<\(self.name)> \(self.text!) </\(self.name)>"
        }else{
            return "<\(self.name) />"
        }
    }
    init(name: String, text: String? = nil) {
        self.name = name
        self.text = text
    }
    deinit {
        print("\(name) HTMLElement is being deinitializaed.")
    }
}

let div = HTMLElement(name: "div", text: "first one div")
let html = div.asHTML()


let heading = HTMLElement(name: "H1")
let defaultText = "some default text"
heading.asHTML = {
    return "<\(heading.name)> \(heading.text ?? defaultText) </\(heading.name)>"
}
heading.asHTML()

var paragraph: HTMLElement? = HTMLElement(name: "p", text: "hello text")
paragraph!.asHTML()
paragraph = nil





