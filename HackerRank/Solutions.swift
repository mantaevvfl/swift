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

// Given an array of n distinct integers p(1), p(2),...,p(n) where 1 <= p(x) <= n, find the value of y such that p(p(y)) = x for every x.
func permutationEquation(p: [Int]) -> [Int] {
    
    var result: [Int] = []
    for x in 1...p.count {
        // Find z such that p(z) = x, then find y such that p(y) = z
        let y = (p.firstIndex(of: (p.firstIndex(of: x)! + 1) )! + 1)
        result.append(y)
    }
    return result

}

// You enter an electronics store and are in need of a keyboard and a hard drive. You are looking to buy at the highest possible price that is within your budget given the cost of each keyboard and hard drive available to you. If it is not possible to buy both items, return -1.
func getMoneySpent(keyboards: [Int], drives: [Int], b: Int) -> Int {
    
    var max: Int = -1
    for keyboardPrice in keyboards {
        for drivePrice in drives {
            let cost = keyboardPrice + drivePrice
            if max < cost && cost <= b {max = cost}
        }
    }
    
    return max

}

// There are n number of prisoners sitting around at a table and a police officer will be handing out m number of sweets to these prisoners sequentially starting from chair number s. If the last sweet tastes awful, determine the prisoner that should be warned.
func saveThePrisoner(n: Int, m: Int, s: Int) -> Int {
    return ((s - 1 + m - 1) % n) + 1
}

// An angry professor decides that he will cancel class if a certain number of students do not show up on time. Given the arrival time of each student and the professor's threshold value, find out whether the class should be cancelled or not.
func angryProfessor(k: Int, a: [Int]) -> String {
    var onTime: Int = 0
    for arrivalTime in a {
        if arrivalTime <= 0 {onTime += 1}
    }
    return onTime >= k ? "NO" : "YES"
}

// Two cats are chasing a mouse. If the cats are some distance units away from the mouse, determine which cat will be the first to reach the mouse. Assume that the cats move at equal speeds and the mouse does not move - it will, however, move if the cats arrive at the same time.
func catAndMouse(x: Int, y: Int, z: Int) -> String {
    let a = abs(x-z)
    let b = abs(y-z)
    
    if a < b {return "Cat A"}
    else if b < a {return "Cat B"}
    else {return "Mouse C"}
}

// A hiker wants to know how many valleys have been encountered during their hike. Assume that the hiker starts at sea level and that each step represents a 1 unit change in altitude. Given the sequence of up and down steps during the hike, find and return the number of valleys traversed. Note that a valley is sequence of consecutive steps below sea level, starting with a step down from sea level and ending with a step up to sea level.
func countingValleys(steps: Int, path: String) -> Int {
    
    var level: Int = 0
    var noOfValleys: Int = 0
    
    for step in path {
        switch step {
            case "U":
                level += 1
            case "D":
                level -= 1
            default:
                break
        }
        
        if level == 0 && step == "U" {noOfValleys += 1}
    }
    return noOfValleys
}

// HackerLand Enterprise is using a viral advertising strategy to promote their product. On their first day, they introduced the new product to exactly 5 people on social media and 2 of them liked it. The next day, the 2 people that liked it shared it with 3 of their friends. Assuming that the number of people that like the product on any given day is always the floor(receipients/2) and that no one receives the advertisement twice, calculate the total number of likes after n days.
func viralAdvertising(n: Int) -> Int {
    
    var shared: Int = 5
    var liked: Int = 2
    var cumulative: Int = 2
    
    for _ in 1..<n {
        shared = liked * 3
        liked = shared/2
        cumulative += liked
    }
    
    return cumulative
    
}

// Find and count the number of digits of any given integer n such that n % digit = 0.
func findDigits(n: Int) -> Int {
    var count: Int = 0
    var num: Int = n
    
    while num > 0 {
        let d = num % 10
        if (d != 0 && (n % d) == 0) {count += 1}
        num /= 10
    }
    
    return count
}

// Given the actual returned and deadline date of a borrowed book, find out how much the borrower should be fined. If no fine is necessary, return 0. The fee structure is as follows:
// 1. If the book is returned on or before the deadline date, the fine is equal to 0
// 2. If the book is returned after the deadline day but still within the same calendar month and year, the fine is equal to 15 x (number of days late)
// 3. If the book is returned after the deadline month but still within the same calendar year, the fine is equal to 500 x (number of months late)
// 4. If the book is returned after the deadline year, the fine is equal to 10,000
func libraryFine(d1: Int, m1: Int, y1: Int, d2: Int, m2: Int, y2: Int) -> Int {
    var fine: Int = 0
    
    if y1 > y2 {fine = 10000}
    else if m1 > m2 && y1 == y2 {fine = (500 * abs(m1-m2))}
    else if d1 > d2 && m1 == m2 && y1 == y2 {fine = (15 * abs(d1-d2))}
    
    return fine

}

// You are given the length of every stick. Your task is to cut down each stick by the length of the smallest stick and discard the sticks of the shortest length (counts as one iteration). Return the number of sticks remaining after each iteration until there are no more sticks left.
func cutTheSticks(arr: [Int]) -> [Int] {
    var result: [Int] = []
    var temp: [Int] = arr
    
    while !temp.isEmpty {
        result.append(temp.count)
        let l = temp.min()
        temp.removeAll(where: { (length: Int) in length == l })
        temp.map({ (length: Int) in length - l! })
    }
    
    return result

}

// A character in a game is hopping on clouds. In the game, the character starts at cloud 0 and has an energy level of 100. A jump of size K uses 1 unit of energy and the character arrives on cloud (I+K) % N after the jump, where I is the current cloud number that the character is on and N is the total number of clouds. The game ends when the character goes back to cloud 0. Given the values of N, K, and the configuration of clouds C, determine the energy level of the character when the game ends.
func jumpingOnClouds(c: [Int], k: Int) -> Int {
    var e: Int = 100
    var i: Int = 0
    var n: Int = c.count

    while (i + k) % n != 0 {
        // Jump onto the next cloud
        i = (i + k) % n
        if c[i] == 1 {e = (e - 1 - 2)}
        else {e -= 1}
    }

    
    return c[0] == 0 ? (e - 1) : (e - 1 - 2)

}

// The distance between two elements in an array is the number of indices between them. Given an array of values a, find the minimum distance between any pair of equal values in the array. If no such value exists, return -1.
func minimumDistances(a: [Int]) -> Int {
    var diff: Int = a.count
    
    for (i, n) in a.enumerated() {
        if let j = a.lastIndex(of: n) {
            if 0 < abs(j-i) && abs(j-i) < diff {diff = abs(j-i)}
        }
    }
    
    return diff != a.count ? diff : -1
}

// Given an array of integers, find the minimum number of elements to delete to leave only elements of wqual values.
func equalizeArray(arr: [Int]) -> Int {
    // Find the element that is repeated the most in the array
    var count: [Int: Int] = [:]
    
    for n in arr {
        count[n] = (count[n] ?? 0) + 1
    }
    
    return arr.count - count.values.max()!
    
}

// You are buying video games form a store called Mist. Usually, all the games are sold at the same price, P dollars. However, they are planning to have a special Halloween sale next month where customers can buy video games for a cheaper price. Specifically, the first game will cost P dollars and then every subsequent purchase will cost D dollars less than the previous one. This continues until the price is less than or equal to M dollars, after which the games will cost M dollars. Given your initial balance S, find and return the number of games you can afford.
func howManyGames(p: Int, d: Int, m: Int, s: Int) -> Int {
    var count: Int = 0, balance = s, price = p
    while balance >= price {
        count += 1
        balance = balance - price
        price = max(price-d, m)
    }
    return count
}

// Little Bobby loves chocolate. He goes to a local store to buy some. At the store, they are having a promotion. If Little Bobby saves enough wrappers, he could turn them in for a free chocolate bar. Suppose you are given the amount of cash N Little Bobby has on him, the cost of each chocolate bar C, and the number of wrappers M needed in order to get a free chocolate bar. Find the total number of chocolate bars that Little Bobby can eat to take full advantage of the promotion.
func chocolateFeast(n: Int, c: Int, m: Int) -> Int {
    
    var barsAtHand = n/c, barsEaten = 0, wrappers = 0
    
    while barsAtHand > 0 {
        barsEaten += barsAtHand
        wrappers += barsAtHand
        
        barsAtHand = wrappers / m
        wrappers = wrappers % m
    }
    
    return barsEaten
}

// A driver is driving on a freeway and notices that the check engine light has turned on. The car needs to get serviced immediately. Luckily, the driver happens to be driving alongside a service lane but the lane varies in width along its length. Given the various widths of the service lane and an entry and exit point, find the maximum vehicle size that can travel through the segment safely.
func serviceLane(n: Int, width: [Int], cases: [[Int]]) -> [Int] {
    var maxWidth: [Int] = []
    
    for points in cases {
        let i = points[0], j = points[1]
        let widths = [Int](width[i...j])
        maxWidth.append(widths.min()!)
    }
    
    return maxWidth
}

// There will be a number of people attending a programming contest. Each of them may be well versed in a number of topics. Given a list of topics for each person, represented as binary strings, find the maximum number of topics a 2-person team can know and also the number of such 2-person teams available. Note that 1 means that the topic is known and 0 means that it is not.
func acmTeam(topic: [String]) -> [Int] {
    let noOfSubjects = topic[0].count
    var max = 0
    var noOfTeams = 0
    for (i,t) in topic[0..<topic.count].enumerated() {
        for j in topic[(i+1)...] {
            var count = 0
            for subjectNo in 0..<noOfSubjects {
                let index = topic[0].index(topic[0].startIndex, offsetBy: subjectNo)
                if String(t[index]) == "1" || String(j[index]) == "1" {
                    count += 1
                }
                
                if count > max {
                    max = count
                    noOfTeams = 0
                }
                if count == max {
                    noOfTeams += 1
                }
            }
        }
    }
    return [max, noOfTeams]
}

// Lisa has received a new math workbook. It contains math problems, grouped into chapters. Lisa believes that a problem is special if its index (within a chapter) is the same as the page number where it is located. Determine the number of special problems contained in Lisa's workbook given the total number of problems for every chapter I, arr[I], the number of problems a single page can hold K, and the number of chapters in the workbook N.
func workbook(n: Int, k: Int, arr: [Int]) -> Int {
    var specialProblems: Int = 0
    var pageNo: Int = 1
    for chapter in 1...n {

        for problemNo in 1...arr[chapter-1] {
            if problemNo == pageNo {specialProblems += 1}
            if problemNo == arr[chapter-1] || problemNo % k == 0 {pageNo += 1}
        }
    }
    return specialProblems
}

// Happy Ladybugs is a board game. The rule is that a ladybug can only be happy if its neighbouring cell is a ladybug of the same color. Determine whether all the ladybugs can be happy after some number of moves. You are given a string b representing the board game, where the ith character of the string denotes the ith cell of the board game.
func happyLadybugs(b: String) -> String {
    // Check the occurence of each character in the string
    for character in b {
        if character != "_" && b.filter({$0 == character}).count == 1 {return "NO"}
    }
    
    if b.filter({$0 == "_"}).count == 0 {
        // Check to see if the ladybugs are already happy
        let startIndex = b.index(b.startIndex, offsetBy: 1)
        let endIndex = b.index(b.endIndex, offsetBy: -2) // \n character
        for (i, character) in b[startIndex...endIndex].enumerated() {
            let leftIndex = b.index(before: b.index(b.startIndex, offsetBy: i+1))
            let rightIndex = b.index(after: b.index(b.startIndex, offsetBy: i+1))
            if b[leftIndex] != character && b[rightIndex] != character {
                return "NO"
            }
        }
    }
    return "YES"
    
}

// A kaprekar number is a positive whole number with a special property. If you square it, then split it into two integers, the sum of those integers is equal to the same value you started with. Find all kaprekar numbers from p to q.
func kaprekarNumbers(p: Int, q: Int) -> Void {
    var kaprekar: [Int] = []
    
    for n in p...q {
        let str = String(n), d = str.count, square = n * n, strSquare = String(square)
        if strSquare.count > 1 {
            let l = strSquare.prefix(strSquare.count-d), r = strSquare.suffix(d)
            if Int(l)! + Int(r)! == n {kaprekar.append(n)}
        }
        else if square == n {
            kaprekar.append(n)
        }
    }
    
    if !kaprekar.isEmpty {
        for number in kaprekar {
            print(number, terminator: " ")
        }
    }
    else {
        print("INVALID RANGE")
    }
}

// A string that contains every letter of the alphabet is a pangram. Given a sentence, determine whether it is a pangram in the English alphabet. Ignore case.
func pangrams(s: String) -> String {
    var uniqueCharacters: Set<Character> = []
    for c in s.lowercased() {
        if c != " " {
            uniqueCharacters.insert(c)
        }
    }
    return uniqueCharacters.count == 26 ? "pangram" : "not pangram"
}

// Reduce a string of lowercase characters by doing a series of operations. In each operation, select pair of adjacent letters that match, and delete them. Delete as many characters as possible using this method and return the resulting string. If the string is empty, return "Empty String"
func superReducedString(s: String) -> String {
    // Reduce the string to its canonical form
    var uniqueCharacters: Set<Character> = Set<Character>()
    for character in s {
        if uniqueCharacters.contains(character) {
            uniqueCharacters.remove(character)
        }
        else {
            uniqueCharacters.insert(character)
        }
        
    }
    return uniqueCharacters.isEmpty ? "Empty String" : String(uniqueCharacters)
}

// A message containing a series of SOS is being sent from Mars to planet Earth. However, some letters of the message change during the transmission due to cosmic radiation. Find and return the number of characters that have been altered.
func marsExploration(s: String) -> Int {
    var count: Int = 0
    let sos: String = "SOS"
    for (i, character) in s.enumerated() {
        if character != sos[sos.index(sos.startIndex, offsetBy: i % 3)] {count += 1}
    }
    return count
}

// Determine whether the given string has a subsequence that spells out "hackerrank". Note that a subsequence maintains order of its characters selected from the sequence.
func hackerrankInString(s: String) -> String {
    let targetStr: String = "hackerrank"
    if s.count < targetStr.count {return "NO"}
    
    var targetIndex = 0
    for character in s {
        if targetStr[targetStr.index(targetStr.startIndex, offsetBy: targetIndex)] == character && targetIndex < targetStr.count {
            targetIndex += 1
        }
    }
    return targetIndex == targetStr.count ? "YES" : "NO"
}

// Given a string S that contains a sequence of words written in CamelCase, determine the number of words in s.
func camelcase(s: String) -> Int {
    var wordCount: Int = 1
    for character in s {
        if character.isUppercase {wordCount += 1}
    }
    return wordCount
}

// There are a collection of rocks with minerals embedded in each one. Each mineral is depicted as a lowercase character in the range from a to z. Note that there may be multiple occurences of a mineral in a rock. A mineral is a gemstone if it is embedded at least once in each of the rocks in the collection. Determine the number of gemstones.
func gemstones(arr: [String]) -> Int {
    var gemstoneCount: Int = 0
    
    for mineral in arr[0] {
        var mineralCount: Int = 1
        for rock in arr[1...] {
            if rock.contains(mineral) {mineralCount += 1}
        }
        if mineralCount == arr.count {gemstoneCount += 1}
    }
    
    return gemstoneCount

}

// Julius Caesar protected his confidential information by encrypting it using a cipher. Caesar's cipher shifts each letter by some number of letters. In the case where a shift takes you past the end of the alphabet, wrap around to the start of the alphabet. Your task is to encrypt the message that is given using Caesar's cipher.
func caesarCipher(s: String, k: Int) -> String {
    var encryptedString: String = String()
    
    for character in s {
        
        // All other characters remain unencrypted
        if !character.isLetter {
            encryptedString += String(character)
            continue
        }
        
        var asciiValue = character.asciiValue! + UInt8(k)
        // A letter can be either lowercase or uppercase
        if character.isUppercase && asciiValue > 90 {
            asciiValue = (asciiValue % 90) + 64
        }
        else if character.isLowercase && asciiValue > 122 {
            asciiValue = (asciiValue % 122) + 96
        }
        
        let encryptedCharacter = String(UnicodeScalar(asciiValue))
        encryptedString += encryptedCharacter
    }
    
    return encryptedString
}

// Determine which pair or pairs of elements in the given array have the smallest absolute difference between them.
func closestNumbers(arr: [Int]) -> [Int] {
    var arr1 = arr
    var result: [Int] = []
    // Sort the given array
    arr1.sort()
    // Find the minimal absolute difference between two numbers
    var min: Int = arr1.max()! - arr1.min()!
    for (i, number) in arr1[0..<(arr1.count-1)].enumerated() {
        if arr1[i+1] - number < min {
            min = arr1[i+1] - number
        }
    }
    // Find and append the pairs with the minimal absolute difference between them to the result
    for (i, number) in arr1[0..<(arr1.count-1)].enumerated() {
        if abs(arr1[i+1] - number) == min {
            result.append(number)
            result.append(arr1[i+1])
        }
    }
    
    return result
}

// James changes all the words in a letter into palindromes. He uses the following rules: 1. You can only reduce the value of the letter by 1 i.e he can change d to c but not c to d 2. The letter a cannot be reduced any further. Each reduction in value of a letter is considered to be a single operation. Find and return the minimum number of operations required to convert the string into a palindrome.
func theLoveLetterMystery(s: String) -> Int {
    var count: Int = 0
    
    var i: Int = 0
    var j: Int = s.count-1
    while i < j {
        
        let iCharacter = s[s.index(s.startIndex, offsetBy: i)]
        let jCharacter = s[s.index(s.startIndex, offsetBy: j)]
        
        if iCharacter != jCharacter {
            count += abs(Int(iCharacter.asciiValue!) - Int(jCharacter.asciiValue!))
        }
        
        i += 1
        j -= 1
    }
    
    return count
}

// There is a strange counter. It starts at 3 at the first second. Each second, it decrements by 1, until it reaches 1. In the next second, it resets to 2 x initial number of the prior cycle and continues counting down. Find and return the number that is displayed by the counter at time t.
func strangeCounter(t: Int) -> Int {
    var initialPriorCycle: Int = 3
    var currentValue: Int = 3
    
    for _ in 2...t {
        if currentValue == 1 {
            currentValue = initialPriorCycle * 2
            initialPriorCycle *= 2
        }
        else {
            currentValue -= 1
        }
    }
    
    return currentValue
}

// You will have to determine if a string is funny or not. A string is funny if the absolute difference in the ascii values of adjacent characters in the string is the same as the absolute difference in ascii values of adjacent characters in reverse.
func funnyString(s: String) -> String {
    
    let asciiOriginal = s.map({$0.asciiValue!})
    let asciiReverse = s.reversed().map({$0.asciiValue!})
    
    for i in 0..<(s.count-1) {
        if abs(Int(asciiOriginal[i])-Int(asciiOriginal[i+1])) != abs(Int(asciiReverse[i])-Int(asciiReverse[i+1])) {return "Not Funny"}
    }
    
    return "Funny"
}

// You are given a odd number of numbers and are asked to find the median. Remember that the median is essentially the middle number after the list has been sorted. It has the same number of elements before it as after.
func findMedian(arr: [Int]) -> Int {
    var temp = arr
    temp.sort()
    return temp[temp.count/2]
}

// Split the given string into two substrings of equal length. Find and return the minimum number of characters that need to be altered in order to make the two substrings anagrams of each other.
func anagram(s: String) -> Int {
    if s.count % 2 != 0 {return -1}
    
    let middle: Int = s.count/2
    // Represent each substring in their canonical form
    let lStr: String = String(s.prefix(middle).sorted()), rStr: String = String(s.suffix(middle).sorted())
    
    var count: Int = 0
    for i in 0..<lStr.count {
        if lStr[lStr.index(lStr.startIndex, offsetBy: i)] != rStr[rStr.index(rStr.startIndex, offsetBy: i)] {count += 1}
    }
    
    return count
}

// Determine if two strings have a common substring. A substring can be as small as one character.
func twoStrings(s1: String, s2: String) -> String {
    
    // Instead of iterating through one of the given strings, it is better to use an array of fixed length to avoid timeout
    let alphabet: [Character] = (97...122).map {i in
        Character(UnicodeScalar(i))
    }
    
    for letter in alphabet {
        if s1.contains(letter) && s2.contains(letter) {return "YES"}
    }
    
    return "NO"
}

// A weighted string is a string of lowercase English characters where each character has a weight (a = 1, b = 2, c = 3,..., z = 26). The weight of a string is the sum of the weights of its characters. Also, note that a uniform string consists of a single character repeated 1 or more times. Find the weight of each possible continguous uniform substrings of string s (let this be U) and then return an array where each element is either "Yes" if queries[i] is an element of U or "No" otherwise.
func weightedUniformStrings(s: String, queries: [Int]) -> [String] {
    var weights: [String:Int] = [String:Int]()
    var result: [String] = []
    
    var key: String = String(s.first!)
    weights[key] = (Int(Character(key).asciiValue!) % 97) + 1
    for i in 1..<s.count {
        let prev: Character = s[s.index(s.startIndex, offsetBy: i-1)]
        let current: Character = s[s.index(s.startIndex, offsetBy: i)]
        
        // Determine key for dicitionary
        if current == prev {key += String(current)}
        else {key = String(current)}
        
        weights[key] = (((Int(current.asciiValue!) % 97) + 1) * key.count)
    }
    // Check if the query exists in weights
    for query in queries {
        weights.values.contains(query) ? result.append("Yes") : result.append("No")
    }
    return result
}

// You are given a increasing sequence of integers arr and asked to find the number of triplets such that i < j < k and arr[j] - arr[i] = arr[k] - arr[j] = d contained in the sequence.
func beautifulTriplets(d: Int, arr: [Int]) -> Int {
    var count: Int = 0
    for i in arr {
        if arr.contains(i+d) && arr.contains(i+d*2) {count += 1}
    }
    return count
}
