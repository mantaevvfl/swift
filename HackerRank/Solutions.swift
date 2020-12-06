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
