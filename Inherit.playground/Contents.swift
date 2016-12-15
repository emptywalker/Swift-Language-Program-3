//: Playground - noun: a place where people can play

import UIKit

class Vehicle {
    var currentSpeed = 0.0
    var description: String {
        return "traveling at \(currentSpeed) miles per hour."
    }
    func makeNoise() {
        
    }
}

let vehicle = Vehicle()
vehicle.currentSpeed = 90.0
vehicle.description

class Bicycle: Vehicle{
    var hasBasket = false
}

let bicycle = Bicycle()
bicycle.hasBasket = true
bicycle.hasBasket

class Train: Vehicle {
    override func makeNoise() {
        print("i don't want to say anything.")
    }
}

let train = Train()
train.makeNoise()

class Car: Vehicle {
    var gear = 0
    override var description: String {
        return super.description + " gear \(gear)"
    }
}
let car = Car()
car.description

class AutomicCar: Car {
    override var currentSpeed: Double {
        didSet{
            gear = Int(currentSpeed / 10) + 1
        }
    }
}

let automicCar = AutomicCar()
automicCar.currentSpeed = 30
automicCar.gear
automicCar.description