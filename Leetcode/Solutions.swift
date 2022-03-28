//
//  Solutions.swift
//  
//
//  Created by Ali Mantaev on 2021-09-17.
//

import Foundation

// Given an integer x, determine if x is a palindrome integer. Note that a palindrome integer is read the same forwards as backwards.
func isPalindrome(_ x: Int) -> Bool {
    let str: String = String(x)
    let reversedStr: String = String(str.reversed())
    return reversedStr == str
}

// Wrtie a function that finds the longest common prefix string amongst an array of strings. Return an empty string if there is no common prefix string.
func longestCommonPrefix(_ strs: [String]) -> String {
    var maxPrefix: String = ""
    let str: String = strs[0]
    if str.count < 1 {return maxPrefix}
    for numberOfCharacters in 1...str.count {
        for word in strs[1...] {
            if str.prefix(numberOfCharacters) != word.prefix(numberOfCharacters) {
                return maxPrefix
            }
        }
        maxPrefix = String(str.prefix(numberOfCharacters))
    }
    return maxPrefix
}

// Given an array of integers nums and a number val, remove all occurences of val in nums in-place. The function should return the number of elements left in nums after the removal.
func removeElement(_ nums: inout [Int], _ val: Int) -> Int {
    nums.removeAll(where: {(num: Int) in num == val})
    return nums.count
}

// Given a string s containing only the characters "(", ")", "{", "}", "[", and "]", determine if the string is valid (i.e opening and closing brackets are of the same type and in the correct order).
func isValid(_ s: String) -> Bool {
    var stack: [Character] = []
    for bracket in s {
        if bracket == "[" || bracket == "(" || bracket == "{" {
            stack.append(bracket)
        }
        else if (bracket == "]" && stack.last == "[") || (bracket == ")" && stack.last == "(") || (bracket == "}" && stack.last == "{") {
            stack.popLast()
        }
        else { return false }
    }
    return stack.isEmpty
}

// Given an array of integers in non-decreasing order, remove all duplicates in the array in-place. Store the result in the first k slots of the array (in some languages it is impossible to change the size of the array). Return k.
func removeDuplicates(_ nums: inout [Int]) -> Int {
    if nums.count <= 1 {return nums.count}
    var target: Int = nums[0]
    var j: Int = 1
    for (i, num) in nums[1...].enumerated() {
        if target != num {
            nums[j] = num
            target = num
            j += 1
        }
    }
    return j
}

// Given an integer number n, return the difference between the product of its digits and sum of its digits.
func subtractProductAndSum(_ n: Int) -> Int {
    var totalSum: Int = 0, totalProduct: Int = 1
    for digitCharacter in String(n) {
        let digit = Int(String(digitCharacter))!
        totalSum += digit
        totalProduct *= digit
    }
    return totalProduct - totalSum
}
