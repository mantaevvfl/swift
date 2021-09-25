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
