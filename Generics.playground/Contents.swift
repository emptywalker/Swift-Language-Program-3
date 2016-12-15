//: Playground - noun: a place where people can play

import UIKit

func swapTwoInts<V>(_ a: inout V, _ b: inout V) {
    let temporaryA = a
    a = b
    b = temporaryA
}
var someInt = 3
var anotherInt = 107
swapTwoInts(&someInt, &anotherInt)
someInt
anotherInt
var someString = "123"
var anotherString = "345"
swapTwoInts(&someString, &anotherString)
someString
anotherString

struct StackInt {
    var items = [Int]()
    mutating func push(_ item: Int){
        items.append(item)
    }
    mutating func pop() {
        items.removeLast()
    }
}