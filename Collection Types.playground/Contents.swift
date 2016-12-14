//: Playground - noun: a place where people can play

import UIKit

var someInts = [Int]()
print("someInts is of type [Int] with \(someInts.count) items.")
someInts.append(3)
someInts = []

var threeDoubles = Array(repeating: 0.0, count: 3)
var anotherThreeDoubles = Array(repeating: 1.2, count: 3)
var sixDoubles = threeDoubles + anotherThreeDoubles

var shopList = ["milk","eggs", "banana", "apple"]
shopList[1...3] = ["hahha"]

for (index, value) in shopList.enumerated() {
    print("Item \(String(index + 1)): \(value)")
}






