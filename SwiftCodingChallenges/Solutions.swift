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
