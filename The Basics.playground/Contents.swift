//: Playground - noun: a place where people can play

import UIKit

//tuples
let http404Error = (404, "Not Found", isSuccess: true)
let (statusCode, statusMessage, _) = http404Error
print(statusCode)
print(statusMessage)
http404Error.1
http404Error.isSuccess

//optional Type
let possibleNumber = "123"
let covertedNumber = Int(possibleNumber)

var serverResponseCode: Int? = 404
serverResponseCode = nil

var surveyAnswer: String?
surveyAnswer = "123"
if covertedNumber != nil {
    print("convertedNumber contains some integer value")
}
if surveyAnswer != nil {
    print("convertedNumber has an integer value of \(covertedNumber!)")
}
//print("convertedNumber has an integer value of \(surveyAnswer!)")

//optnial binding
if let actualNumber = Int(possibleNumber) {
    print("\'\(possibleNumber)\' has an integer value of \(actualNumber)")
}
 print(Int("123"))

//implicitly unwrapped optionals
var possibleString: String? = "An optinal string."
let forcedString: String = possibleString!;

var assumedString: String! = "An implicitly unwrapped optional string."
assumedString = nil
let implicitlyString = assumedString

//Nil Coalescing Operator
let defaultColorName = "red"
var userDefineColorName: String?

var colorNameToUse = userDefineColorName ?? defaultColorName
userDefineColorName = "green"
colorNameToUse = userDefineColorName ?? defaultColorName


//Logical Operator
//  !
let allowedEntry = false
if !allowedEntry {
    print("ACCESS DEINIED")
}



































		