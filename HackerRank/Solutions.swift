import Foundation

// Converting 12-hour AM/PM time format to 24-hour.
var s = "07:05:45PM"

let df = DateFormatter()
df.dateFormat = "hh:mm:ssa"
let date12 = df.date(from: s)

df.dateFormat = "HH:mm:ss"
let date24 = df.string(from: date12!)

print(date24)


// Given an array of integers n, find and count the number of pairs such that i < j and ar[i] + ar[j] is evenly divisible by k.
func divisibleSumPairs(n: Int, k: Int, ar: [Int]) -> Int {
    var count: Int = 0
    
    for (i, valueI) in ar.enumerated() {
        for valueJ in ar[(i+1)...] {
            if (valueI + valueJ) % k == 0 {
                count += 1
            }
        }
    }
    return count

}

let result = divisibleSumPairs(n: 5, k: 5, ar: [1,2,3,4,5,6])

// Apple and Oranges problem. Given the location of an apple and orange tree, the distance units of the apples and oranges that have fell relative to their tree, and the range of space that your house takes up. Determine how many apples and oranges fell on your house.

func countApplesAndOranges(s: Int, t: Int, a: Int, b: Int, apples: [Int], oranges: [Int]) -> Void {
    var appleHit: Int = 0, orangeHit: Int = 0
    
    let appleLocations: [Int] = apples.map {$0 + a}
    let orangeLocations: [Int] = oranges.map {$0 + b}
    
    for appleLoc in appleLocations {
        if s <= appleLoc && appleLoc <= t {
            appleHit += 1
        }
    }
    
    for orangeLoc in orangeLocations {
        if s <= orangeLoc && orangeLoc <= t {
            orangeHit += 1
        }
    }
    
    print(appleHit)
    print(orangeHit)
}

// Find and print the number of times the player has broken their most and least points scored throughout the season.
func breakingRecords(scores: [Int]) -> [Int] {
    var maxAndMinPointsBroken: [Int] = [0,0]
    
    var maxPoints: Int = scores[0]
    var minPoints: Int = scores[0]
    
    for i in 1..<scores.count {
        if scores[i] > maxPoints {
            maxPoints = scores[i]
            maxAndMinPointsBroken[0] += 1
        }
        else if scores[i] < minPoints {
            minPoints = scores[i]
            maxAndMinPointsBroken[1] += 1
        }
    }
    
    return maxAndMinPointsBroken

}


// You are given an array of integers. Find the number of pairs of size m such that its sum is equal to d.
func birthday(s: [Int], d: Int, m: Int) -> Int {
    var c: Int = 0
    
    for i in 0...(s.count-m) {
        // Retrieve a sub-array of s from i to i+m-1
        var subArray = s[i...(i+(m-1))]
        var sum = subArray.reduce(0, +)
        if sum == d {c += 1}
    }
    return c

}

// A record of different type of birds sighted have been given to you (ex. [2, 2, 1, 3]). Return the bird type that was sighted the most. If two or more birds were sighted the most, return the bird with the lowest type number.
func migratoryBirds(arr: [Int]) -> Int {
    
    var maxSighted = 0
    var type = 0
    
    var birdsSighted: [Int] = arr
    
    while !birdsSighted.isEmpty {
        let typeEval = birdsSighted[0]
        let l = birdsSighted.count // length before removal
        birdsSighted.removeAll(where: {$0 == typeEval})
        if (l - birdsSighted.count) > maxSighted {
            maxSighted = l - birdsSighted.count
            type = typeEval
        }
        else if (l - birdsSighted.count) == maxSighted {
            if typeEval < type {type = typeEval}
        }
    }

    return type
    
}

// Brian and Anna go out to dinner together. Brian receives the cost of each item that was ordered. Brian has to divide the total cost evenly between him and Anna. By taking into account that Anna does not eat one of the meals ordered, check whether Brian's calculation is correct. If it is, print "Appetit", otherwise, print what Brian owes Anna.
func bonAppetit(bill: [Int], k: Int, b: Int) -> Void {
    let totalCost = bill.reduce(0, +)
    let bActual = (totalCost - bill[k])/2
    return b == bActual ? print("Bon Appetit") : print(b - bActual)
}

// Determine the number of pairs of socks of the same color, For example, [2, 2, 1, 2, 3, 1] should return 2.
func sockMerchant(n: Int, ar: [Int]) -> Int {
    var numOfPairs: Int = 0
    var socks: [Int] = ar
    while !socks.isEmpty {
        let sockColor = socks[0]
        let l = socks.count
        socks.removeAll(where: {$0 == sockColor})
        numOfPairs += (l - socks.count)/2
    }
    return numOfPairs

}

// Alternative solution using Swift's Set type.
func sockMerchant(n: Int, ar: [Int]) -> Int {
    var uniqueSockColors = Set<Int>()
    var numOfPairs: Int = 0

    for sockColor in ar {
        if !uniqueSockColors.contains(sockColor) {
            uniqueSockColors.insert(sockColor)
        }
        else {
            numOfPairs += 1
            uniqueSockColors.remove(sockColor) // all elements in a set are unique
        }
    }

    return numOfPairs

}

// Find the minimum number of page turns to reach page number p. You can start from either the beginning or end of the book.
func pageCount(n: Int, p: Int) -> Int {
    return min(p/2, n/2-p/2)
}

// Find and return the count of the longest subarray whose elements have an absolute difference less than or equal to 1. [1,1,2,2,4,4,5] -> [1,1,2,2] and [4,4,5] -> 4
func pickingNumbers(a: [Int]) -> Int {
    var maximum = 0
    
    for number in a {
        var tempArray: [Int] = a
        tempArray.removeAll(where: {$0 < (number-1) || $0 > number})
        
        if tempArray.count > maximum {maximum = tempArray.count}
    }
    
    return maximum

}

// A character in a video game is taking part in a hurdle race with hurdles of varying heights. The character can jump k units high and can drink a magic potion to increase his height by 1 unit. How many does of the potion should the character take to be able to jump all the hurdles?
func hurdleRace(k: Int, height: [Int]) -> Int {
    let tallestHurdle: Int = height.max()!
    let diff = tallestHurdle - k
    return diff > 0 ? diff : 0
}



// Given the height of each letter in the alphabet, find the area of any word (assume that it takes the shape of a rectangle).
func designerPdfViewer(h: [Int], word: String) -> Int {
   
    // An array containing all the letters of the alphabet
    let alphabet: [Character] = (0...25).map {
        i in
        Character(Unicode.Scalar(97 + i))
    }
    
    var wh: [Int] = [Int]()
    for char in word {
        wh.append(h[alphabet.firstIndex(of: char)!])
    }
    let l: Int = wh.max()!
    let w: Int = word.count
    return l*w
}

// The Utopian tree has 2 growth cycles per year. It doubles in height every spring and increases in height by 1 meter every summer. Assuming that the tree is planted in spring and has an initial height of 1 meter, find the height of the tree after n number of growth cycles.
func utopianTree(n: Int) -> Int {
    var h: Int = 0
    for cycleNo in 0...n {
        h = ((cycleNo % 2) == 1 ? (h * 2) : (h + 1))
    }
    return h
}

// Perform k number of right circular rotations on an array and then return the value of the elements in the array at the specified indices. A right circular rotation is when the last array element is moved to the first position and the remaining elements are shifted one to the right.
func circularArrayRotation(a: [Int], k: Int, queries: [Int]) -> [Int] {
    
    var i: Int = k % a.count
    
    var temp: [Int] = Array(repeating: 0, count: a.count)
    for number in a {
        temp[i] = number
        i += 1
        if i == a.count {i = 0}
    }
    
    var result: [Int] = []
    for q in queries {
        result.append(temp[q])
    }
    return result
}
