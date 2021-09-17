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
