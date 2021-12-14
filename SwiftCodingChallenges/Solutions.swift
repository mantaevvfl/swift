//
//  Solutions.swift
//  
//
//  Created by Ali Mantaev on 2021-11-13.
//

//----- Strings -----//

// 1. Write a function that takes input of type String and returns true if the letters of the string are unique. Note that the function should be case-sensitive (i.e A does not equal to a).
func challengeUnqiueString2(input: String) -> Bool {
    let uniqueCharacters: Set<Character> = Set(input)
    return uniqueCharacters.count == input.count
}

// 2. Write a function that returns true if the input string is read the same forwards as backwards ignoring case.
func challengePalindrome(input: String) -> Bool {
    // racecar -> true, madam -> true, pie -> false
    let lowercase = input.lowercased()
    return lowercase.reversed() == Array(lowercase)
}

// 3. Write a function that accepts two String parameters and returns true if they contain the same letters in any order taking into account letter case
func challengeSameLetters(s1: String, s2: String) -> Bool {
    // abcd, dcba -> true, abc, cbAa -> false
    // convert input strings to their canoncial forms (i.e most basic forms)
    return s1.sorted() == s2.sorted()
}

// 5. Write a program that retruns the total number of occurrences of a character in a string.
func challengeCount(input: String, c: Character) -> Int {
    // input: "The rain in Spain", character: "a" -> 2
    var count: Int = 0
    for character in input {
        if character == c {count += 1}
    }
    return count
}

// 6. Write a function that removes duplicate letters of a given string.
func challengeRemoveDuplicates(input: String) -> String {
    var result: String = ""
    for character in input {
        if !result.contains(character) {
            result.append(character)
        }
    }
    return result
}

// 7. Write a function that replaces any consecutive whitespaces with a single space.
func challengeCondenseWhitespace(input: String) -> String {
    // [space][space][space]a -> [space]a
    var result: String = String()
    var seenSpace: Bool = false
    
    for character in input {
        if character == " " {
            if seenSpace { continue } else { seenSpace = true }
        } else {
            seenSpace = false
        }
        
        result.append(character)
    }
    return result
}

//----- Numbers -----//

// 16. Write a program that counts from 1 to 100 and prints out "Fizz" if the count is evenly divisble 3, "Buzz" if the count is evenly divisble by 5, and "Fizz Buzz" if the count is evenly divisible by 3 and 5. For all other cases, print the count number.
func challengeFizzBuzz() -> Void {
    for count in 1...100 {
        if count % 3 == 0 {
            if count % 5 == 0 {
                print("Fizz Buzz")
            } else {
                print("Fizz")
            }
        } else if count % 5 == 0 {
            print("Buzz")
        } else {
            print(count)
        }
    }
}

// 17. Write a program that generates a random number between given minimum and maximum values of a range (inclusive).
func challengeRandomNumber(min: Int, max: Int) -> Int {
    Int(arc4random_uniform(UInt32(max - min + 1))) + min
}

//----- Collections -----//

// 37. Write an extension for a collection of integers that returns the number of times a specific digit appears in all of its elements.
extension Collection where Iterator.Element == Int {
    func digitCount(_ count: Character) -> Int {
        var result = 0
        // loop though the digits of each number and increae the count if digit is equal to the count
        for number in self {
            let string = String(number)
            for digit in string {
                if digit == count { result += 1 }
            }
        }
        return result
    }
}

// 38. Find and return an array containing the N smallest items in a given collection. Note that the returned array must be sorted in increasing order.
extension Collection where Iterator.Element: Comparable {
    func smallestN(n: Int) -> [Iterator.Element] {
        if n >= self.count {return []}
        // sort the array in increasing order and then use the prefix method to capture the first N elements of the array
        let array = self.sorted()
        return Array(array.prefix(n))
    }
}

// 39. Extend collections with a function that returns an array of strings sorted by their lengths (i.e longest to shortest)
extension Collection where Iterator.Element == String {
    func sortLength() -> [String] {
        return self.sorted(by: {
            $0.count > $1.count
        })
    }
}

// 40. Write a function that accepts an array of unsorted numbers form 1 to 100 where zero or more numbers may be missing, and returns an array of the msising numbers.
func missingNumbers(input: [Int]) -> [Int] {
    let numbers = Array(1...100)
    let inputSet = Set(input)
    var result: [Int] = []
    for number in numbers {
        if !inputSet.contains(number) {
            result.append(number)
        }
    }
    return result
}

// 41. Write an extension to Collection that returns the median value of a given sorted integer array if there is one. If not, then it returns nil.
extension Collection where Iterator.Element == Int {
    func median() -> Int? {
        if self.isEmpty {return nil}
        
        let middleIndex = (self.count - 1) / 2
        let sorted = self.sorted()
        
        if self.count % 2 == 1 {
            return sorted[middleIndex]
        } else {
            // Get the mean of the two middle values
            return sorted[middleIndex] + sorted[middleIndex - 1] / 2
        }
    }
}

// 42. Write an extension for all collections that reimplements the index(of:) method.
extension Collection where Iterator.Element: Equatable {
    func findIndex(of element: Iterator.Element) -> Int? {
        for (i, value) in self.enumerated() {
            if value == element {return i}
        }
        return nil
    }
}

// 43. Create a linked list of lowercae English alphabet letters with one method that traverses all the nodes and prints their letters on a single line separated by spaces.
class LinkedList {
    var head: Node?
    var tail: Node?
    
    var first: Node? {
        return head
    }
    
    var last: Node? {
        return tail
    }
    var isEmpty: Bool {
        return head == nil
    }
    
    func append(value: Character) -> Void {
        let newNode = Node(value: value)
        
        if let tailNode = tail {
            tailNode.next = newNode
        } else {
            head = newNode
        }
        tail = newNode
    }
    
    func printNodes() {
        var currentNode = head
        while let node = currentNode {
            print(node.value, terminator: " ")
            currentNode = node.next
        }
    }
    
}

class Node {
    var value: Character
    var next: Node?
    
    init(value: Character, next: Node? = nil) {
        self.value = value
        self.next = next
    }
}

let linkedList = LinkedList()
let alphabet = (97...122).map {
    Character(UnicodeScalar($0))
}
for letter in alphabet {
    linkedList.append(value: letter)
}

// 44. Extend your linked list class to include a method that returns the node at mid-point of the list using no more one loop.
extension LinkedList {
    func findCenterNode() -> Node? {
        // 1, 2, 3, 4, 5 -> 3
        var pointerA: Node? = head
        var pointerB: Node? = head
        while pointerB != nil && pointerB?.next != nil {
            pointerA = pointerA?.next
            pointerB = pointerB?.next?.next
        }
        return pointerA
    }
}

// 46. Write an extension for all collections that reimplements the map method.
extension Collection {
    func myMap<T>(_ mapFunction: (Self.Element) throws -> T) rethrows -> [T] {
        var result: [T] = []
        for element in self {
            result.append(try(mapFunction(element)))
        }
        return result
    }
}

// 47. Write an extnension for all collections that reimplements the min method.
extension Collection where Element: Comparable {
    func myMin() -> Element? {
        var it = makeIterator()
        guard var min = it.next() else {return nil}
        while let item = it.next() {
            if item < min {min = item}
        }
        return min
    }
}

