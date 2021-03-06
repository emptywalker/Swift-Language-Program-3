//: Playground - noun: a place where people can play

import UIKit

class Person {
    var residence: Residence?
}
class Residence {
    var rooms = [Room]()
    var numberOfRooms: Int {
        return rooms.count
    }
    subscript (i: Int) -> Room {
        get{
           return rooms[i]
        }
        set{
            rooms[i] = newValue
        }
    }
    func printNumberOfRooms() {
        print("The number of rooms is \(numberOfRooms)")
    }
    var address: Address?
}

class Room {
    let name: String
    init(name: String) {
        self.name = name
    }
}
class Address {
    var buildingName: String?
    var buildingNumber: String?
    var street: String?
    func buildingIdentifier() -> String? {
        if buildingName != nil {
            return buildingName
        } else if buildingNumber != nil && street != nil {
            return "\(buildingNumber)   \(street)"
        } else {
            return nil
        }
    }
}

let john = Person()
john.residence = Residence()
if let roomNumber = john.residence?.numberOfRooms{
    print("John's residence has \(roomNumber) rooms.")
} else {
    print("Unable to retrieve the number of rooms.")
}
