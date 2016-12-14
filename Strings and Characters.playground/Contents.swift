//: Playground - noun: a place where people can play

import UIKit

var emptyString = ""
var anotherEmptyString = String()
if emptyString.isEmpty {
    print("Nothing to see here")
}

var variableString = "Horse"
variableString += " and carriage"

let constantString = "Highlander"
//constantString += " and another highlander"

for character in constantString.characters{
    print("\(character) ", terminator: "")
}


let catChatacters: [Character] = ["C", "a", "t", "!", "🐱"]
var catString = String(catChatacters)
let exclamationMark: Character = "!"
catString.append(exclamationMark)

let mutiplier = 3
let message = "\(mutiplier) times 2.5 is \(Double(mutiplier) * 2.5)"
"sdasd"

"\" \'  \t \n \\"

let wiseWords = "\"Imagination is more important than knowledge\" -Einstein"
let dollarSign = "\u{24}"
let blackHeart = "\u{2665}"
let sparklingHeart = "\u{1F496}"

let eAcute: Character = "\u{E9}"
let combinedEAcute: Character = "\u{65}\u{301}"


var word = "cafe"
word += "\u{301}"

let greeting = "Guten Tag!"
let startIndex = greeting.startIndex
greeting[startIndex]
greeting.endIndex
greeting[greeting.index(before: greeting.endIndex)]
greeting[greeting.index(after: startIndex)]
greeting[greeting.index(startIndex, offsetBy: 7)]
//greeting[greeting.endIndex]
print("\n")
for index in greeting.characters.indices {
    print("\(greeting[index])", terminator: "")
}

var welcome = "hello"
welcome.insert("!", at: welcome.endIndex)
let wordNew = " word"
welcome.insert(contentsOf: wordNew.characters, at: welcome.index(before: welcome.endIndex))
welcome.remove(at: welcome.index(before: welcome.endIndex))
welcome

let range = welcome.index(welcome.endIndex, offsetBy: -5) ..< welcome.endIndex
welcome .removeSubrange(range)
welcome
























































