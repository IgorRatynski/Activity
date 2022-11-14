//
//  EasyStringTasks.swift
//  Easy
//
//  Created by Igor Ratynski on 22.07.2022.
//

import Foundation

// MARK: Most words found
extension Solution.Easy {
  func mostWordsFound(_ sentences: [String]) -> Int {
    var result = 1, tempResult: Int
    
    for sentence in sentences {
      tempResult = 1
      for letter in sentence {
        guard letter == " " else { continue }
        tempResult += 1
      }
      
      if result < tempResult {
        result = tempResult
      }
    }
    
    return result
  }
}

// MARK: Add strings
extension Solution.Easy {
  func addStrings(_ num1: String, _ num2: String) -> String {
    var result = "", addToNext = false, tempResult: Int, num1 = num1, num2 = num2, temp1: Int, temp2: Int
    
    while !num1.isEmpty || !num2.isEmpty || addToNext {
      temp1 = 0; temp2 = 0
      
      if !num1.isEmpty {
        temp1 = Int(String(num1.removeLast()))!
      }
      if !num2.isEmpty {
        temp2 = Int(String(num2.removeLast()))!
      }
      
      tempResult = temp1 + temp2 + (addToNext ? 1 : 0)
      
      if tempResult > 9 {
        tempResult -= 10
        addToNext = true
      } else {
        addToNext = false
      }
      result.append(String(tempResult))
    }
    
    return String(result.reversed())
  }
}

// MARK: Letter combinations
extension Solution.Easy {
  func restoreString(_ s: String, _ indices: [Int]) -> String {
    var result = Array<Character>(repeating: " ", count: s.count)
    for (index, item) in s.enumerated() {
      result[indices[index]] = item
    }
    return String(result)
  }
}

// MARK: Find the difference
extension Solution.Easy {
  func findTheDifference(_ s: String, _ t: String) -> Character {
    let last = t.last!, s = Array<Character>(s), t = Array<Character>(t)
    var sDictionary: [Character:Int] = [:], tDictionary: [Character:Int] = [:]
    
    for index in 0..<s.count {
      sDictionary[s[index]] = (sDictionary[s[index]] ?? 0) + 1
      tDictionary[t[index]] = (tDictionary[t[index]] ?? 0) + 1
    }
    tDictionary[last]  = (tDictionary[last] ?? 0) + 1
    
    for key in tDictionary.keys {
      guard sDictionary[key] != nil else { return key }
      guard sDictionary[key] != tDictionary[key] else { continue }
      return key
    }
    return last
  }
}

// MARK: Truncate sentence
extension Solution.Easy {
  func truncateSentence(_ s: String, _ k: Int) -> String {
    var wordsIndex = 0, resultIndex = s.count
    
    for (index, value) in s.enumerated() {
      guard value == " " else { continue }
      wordsIndex += 1
      guard k == wordsIndex else { continue }
      resultIndex = index
      break
    }
    
    let index = s.index(s.startIndex, offsetBy: resultIndex)
    return s.substring(to: index)
  }
}

// MARK: Unique morse representations
extension Solution.Easy {
  func uniqueMorseRepresentations(_ words: [String]) -> Int {
    let letters: [Character:String] = ["a":".-","b":"-...","c":"-.-.","d":"-..","e":".","f":"..-.","g":"--.","h":"....","i":"..","j":".---","k":"-.-","l":".-..","m":"--","n":"-.","o":"---","p":".--.","q":"--.-","r":".-.","s":"...","t":"-","u":"..-","v":"...-","w":".--","x":"-..-","y":"-.--","z":"--.."]
    var result = Set<String>(), tempString: String
    
    for word in words {
      tempString = ""
      for character in word {
        tempString.append(letters[character]!)
      }
      result.insert(tempString)
    }
    
    return result.count
  }
}

// MARK: Is isomorphic
extension Solution.Easy {
  func isIsomorphic(_ s: String, _ t: String) -> Bool {
    guard s.count == t.count else { return false }
    let s = Array<Character>(s), t = Array<Character>(t)
    var sMap: [Character:Int] = [:], tMap: [Character:Int] = [:]
    for index in 0..<s.count {
      if sMap[s[index]] == nil {
        sMap[s[index]] = index
      }
      if tMap[t[index]] == nil {
        tMap[t[index]] = index
      }
      if sMap[s[index]] != tMap[t[index]] {
        return false
      }
    }
    
    return true
  }
}

// MARK: Max score
extension Solution.Easy {
  func maxScore(_ s: String) -> Int {
    var result = 0, left: Substring, right: Substring, sIndex: String.Index
    // TODO: optimization: check is need to go further
    // string -> [Int] of 0 indexes and count how many before string devider and fullCount - devider - zeroCount after
    for index in 1..<s.count {
      sIndex = s.index(s.startIndex, offsetBy: index)
      left = s[s.startIndex..<sIndex]
      right = s[sIndex..<s.endIndex]
      
      result = max(result, left.filter { $0 == "0" }.count + right.filter { $0 == "1" }.count)
    }
    return result
  }
}

// MARK: Can construct
extension Solution.Easy {
  func canConstruct(_ ransomNote: String, _ magazine: String) -> Bool {
    guard ransomNote.count <= magazine.count else { return false }
    var ransomNoteDict: [Character:Int] = [:], magazineDict: [Character:Int] = [:]
    
    for letter in ransomNote {
      ransomNoteDict[letter] = (ransomNoteDict[letter] ?? 0) + 1
    }
    for letter in magazine {
      magazineDict[letter] = (magazineDict[letter] ?? 0) + 1
    }
    
    for (key, value) in ransomNoteDict {
      guard (magazineDict[key] ?? -1) >= value else { return false }
    }
    
    return true
  }
}

// MARK: Is anagram
extension Solution.Easy {
  func isAnagram(_ s: String, _ t: String) -> Bool {
    guard s.count == t.count else { return false }
    // I
//    var sDict: [Character:Int] = [:], tDict = sDict
//
//    for char in s {
//      sDict[char] = (sDict[char] ?? 0) + 1
//    }
//    for char in t {
//      tDict[char] = (tDict[char] ?? 0) + 1
//    }
//
//    return sDict == tDict
    
    // II
    var sDict: [Character:Int] = [:]
    
    for char in s {
      sDict[char] = (sDict[char] ?? 0) + 1
    }
    for char in t {
      sDict[char] = (sDict[char] ?? 0) - 1
      guard sDict[char]! > -1 else { return false }
    }
    
    return sDict.values.first { $0 > 0 } == nil
  }
}

// MARK: 14. Longest Common Prefix
extension Solution.Easy {
  func longestCommonPrefix(_ strs: [String]) -> String {
    guard strs.count > 1 else { return strs.first! }
    var result: String = strs.first!, goNext: Bool
    
    for index in 1..<strs.count {
      guard !strs[index].hasPrefix(result) else { continue }
      goNext = false
      while !goNext && !result.isEmpty {
        result.removeLast()
        guard strs[index].hasPrefix(result) else { continue }
        goNext = true
      }
      guard !result.isEmpty else { return "" }
    }
    
    return result
  }
}

// MARK: Is subsequence
extension Solution.Easy {
  func isSubsequence(_ s: String, _ t: String) -> Bool {
    guard !s.isEmpty else { return true }
    var s = s, current = s.removeFirst()
    
    for character in t {
      guard character == current else { continue }
      guard !s.isEmpty else { return true }
      current = s.removeFirst()
    }
    return false
  }
}

// MARK: Check zero ones
extension Solution.Easy {
  func checkZeroOnes(_ s: String) -> Bool {
    var s = s, previous = s.removeFirst(), count: [Character:Int] = [:], tempCount: Int = 1
    
    for character in s {
      if character == previous {
        tempCount += 1
      } else {
        if count[previous] ?? 0 < tempCount {
          count[previous] = tempCount
        }
        tempCount = 1
        previous = character
      }
    }
    
    if count[previous] ?? 0 < tempCount {
      count[previous] = tempCount
    }
    
    return (count["1"] ?? 0) > (count["0"] ?? 0)
  }
}

// MARK: 557. Reverse words
extension Solution.Easy {
  func reverseWords(_ s: String) -> String {
    // I
//    s.components(separatedBy: " ")
//      .map { String($0.reversed()) }
//      .joined(separator: " ")
    
    // II
    var word: [Character] = [], result = ""
    for character in s {
      guard character == " " else {
        word.append(character)
        continue
      }
      for index in stride(from: word.count - 1, through: 0, by: -1) {
        result.append(word[index])
      }
      word.removeAll()
      result.append(" ")
    }
    
    for index in stride(from: word.count - 1, through: 0, by: -1) {
      result.append(word[index])
    }
    
    return result
  }
}

// MARK: 819. Most common word
private extension Bool {
  var negation: Bool { !self }
}
extension Solution.Easy {
  func mostCommonWord(_ paragraph: String, _ banned: [String]) -> String {
    var dictionary: [String:Int] = [:], count = 0, word = ""
    paragraph
      .split(whereSeparator: \.isLetter.negation)
      .map { String($0.lowercased()) }
      .forEach {
        guard !banned.contains($0) else { return }
        dictionary[$0] = (dictionary[$0] ?? 0) + 1
        if dictionary[$0]! > count {
          count = dictionary[$0]!
          word = $0
        }
      }
    return word
  }
}

// MARK: 821. Shortest distance to a character
extension Solution.Easy {
  func shortestToChar(_ s: String, _ c: Character) -> [Int] {
    var count = s.count, result: [Int] = [], s = s.enumerated().compactMap { $0.element == c ? $0.offset : nil }
    var firstIndex = s.removeFirst(), secondIndex: Int?, firstIndexValue: Int, secondIndexValue: Int
    if !s.isEmpty {
      secondIndex = s.removeFirst()
    }
    
    for index in 0..<count {
      firstIndexValue = abs(firstIndex - index)
      secondIndexValue = abs((secondIndex ?? firstIndex) - index)
      result.append(min(firstIndexValue, secondIndexValue))
      
      guard firstIndexValue > secondIndexValue else { continue }
      firstIndex = secondIndex!
      
      guard !s.isEmpty else { continue }
      secondIndex = s.removeFirst()
    }
    
    return result
  }
}

// MARK: 824. Goat Latin
extension Solution.Easy {
  func toGoatLatin(_ sentence: String) -> String {
    let vowels: Set<Character> = ["a", "e", "i", "o", "u", "A", "E", "I", "O", "U"]
    return sentence
      .components(separatedBy: " ")
      .enumerated().map {
        var element = $0.element
        return (vowels.contains($0.element.first!) ? $0.element : String(element.dropFirst()) + String(element.removeFirst()))
        + "ma" + String(repeating: "a", count: $0.offset + 1)
      }
      .joined(separator: " ")
  }
}

// MARK: 844. Backspace string compare
extension Solution.Easy {
  func backspaceCompare(_ s: String, _ t: String) -> Bool {
//    // I
//    func cleaned(string: String) -> String {
//      var result = ""
//      for value in string {
//        if value == "#" {
//          guard !result.isEmpty else { continue }
//          result.removeLast()
//        } else {
//          result.append(value)
//        }
//      }
//      return result
//    }
//
//    return cleaned(string: s) == cleaned(string: t)
    // II
    var s = s, t = t, index: String.Index?
    
    func clean(string: inout String) {
      while true {
        index = string.firstIndex(where: { $0 == "#" })
        guard index != nil else { break }
        string.remove(at: index!)
        guard index != string.startIndex else { continue }
        index = string.index(before: index!)
        string.remove(at: index!)
      }
    }
    
    clean(string: &s)
    clean(string: &t)
    
    return s == t
  }
}

// MARK: 796. Rotate String
extension Solution.Easy {
  func rotateString(_ s: String, _ goal: String) -> Bool {
    guard s.count == goal.count else { return false }
    guard s != goal else { return true }
    var s = s
    
    for _ in 0..<s.count - 2 {
      s = String(s.removeLast()) + s
      guard s == goal else { continue }
      return true
    }
    
    return false
  }
}

// MARK: 2129. Capitalize the Title
extension Solution.Easy {
  func capitalizeTitle(_ title: String) -> String {
    title
      .components(separatedBy: " ")
      .map { $0.count > 2 ? $0.prefix(1).uppercased() + $0.dropFirst().lowercased() : $0.lowercased() }
      .joined(separator: " ")
  }
}

// MARK: 709. To Lower Case
extension Solution.Easy {
  func toLowerCase(_ s: String) -> String {
    // I
//    return s.lowercased()
    // II
    let alphabet: [Character:Character] = ["A":"a", "B":"b", "C":"c", "D":"d", "E":"e", "F":"f", "G":"g", "H":"h", "I":"i", "J":"j", "K":"k", "L":"l", "M":"m", "N":"n", "O":"o", "P":"p", "Q":"q", "R":"r", "S":"s", "T":"t", "U":"u", "V":"v", "W":"w", "X":"x", "Y":"y", "Z":"z"]
    return String(s.map { alphabet[$0] != nil ? alphabet[$0]! : $0 })
  }
}

// TODO: 125. Valid Palindrome
extension Solution.Easy {
  func isPalindrome(_ s: String) -> Bool {
//    // I
//    let a = Array(s.lowercased().replacingOccurrences(of:"[^0-9a-z]", with: "", options: .regularExpression))
//
//    var last = a.count - 1
//    for first in 0..<a.count / 2 {
//      guard a[first] == a[last] else { return false }
//      last -= 1
//    }
//    return true
    
    // II
    let validCharacters: [Character:Character] = ["A":"a", "B":"b", "C":"c", "D":"d", "E":"e", "F":"f", "G":"g", "H":"h", "I":"i", "J":"j", "K":"k", "L":"l", "M":"m", "N":"n", "O":"o", "P":"p", "Q":"q", "R":"r", "S":"s", "T":"t", "U":"u", "V":"v", "W":"w", "X":"x", "Y":"y", "Z":"z", "0":"0", "1":"1", "2":"2", "3":"3", "4":"4", "5":"5", "6":"6", "7":"7", "8":"8", "9":"9"]
    let s = s.compactMap { validCharacters[$0] != nil ? validCharacters[$0] : validCharacters.values.contains($0) ? $0 : nil }
    var right = s.count - 1
    for left in 0..<s.count / 2 {
      guard s[left] == s[right] else { return false }
      right -= 1
    }
    
    return true
  }
}

// MARK: 2108. Find First Palindromic String in the Array
extension Solution.Easy {
  func tee() {
    let words = ["racecar","cool"]
    print(firstPalindrome(words))
  }
  func firstPalindrome(_ words: [String]) -> String {
    var isPalindrome: Bool, left: String.Index, right: String.Index
    for word in words {
      isPalindrome = true
      left = word.startIndex
      right = word.index(before: word.endIndex)
      
      for _ in 0..<word.count / 2 {
        guard word[left] == word[right] else {
          isPalindrome = false
          break
        }
        left = word.index(after: left)
        right = word.index(before: right)
      }
      
      guard isPalindrome else { continue }
      return word
    }
    
    return ""
  }
}

// MARK: 67. Add Binary
extension Solution.Easy {
  func addBinary(_ a: String, _ b: String) -> String {
    // I
//    var result = "", plusOne = false, tempA: Character, tempB: Character, a = a, b = b
//    while !a.isEmpty || !b.isEmpty || plusOne {
//      tempA = a.isEmpty ? "0" : a.removeLast()
//      tempB = b.isEmpty ? "0" : b.removeLast()
//
//      switch (tempA, tempB, plusOne) {
//        case ("0", "0", true):
//          plusOne = false
//          result.append("1")
//
//        case ("0", "1", false), ("1", "0", false): result.append("1")
//        case ("0", "1", true), ("1", "0", true): result.append("0")
//
//        case ("1", "1", false), ("1", "1", true):
//          result.append(plusOne ? "1" : "0")
//          plusOne = true
//
//        default: result.append("0")
//      }
//    }
//    return String(result.reversed())
    
    // II
    func value(from string: String, by index: inout String.Index) -> Character {
      guard index != string.startIndex else { return "0" }
      index = string.index(before: index)
      return string.indices.contains(index) ? string[index] : "0"
    }
    
    var result = "", plusOne = false, indexA = a.endIndex, indexB = b.endIndex
    
    while indexA != a.startIndex || indexB != b.startIndex || plusOne {
      
      switch (value(from: a, by: &indexA), value(from: b, by: &indexB), plusOne) {
          
        case ("0", "0", true), ("0", "1", false), ("1", "0", false):
          plusOne = false
          result.append("1")

        case ("0", "1", true), ("1", "0", true):
          result.append("0")

        case ("1", "1", false), ("1", "1", true):
          result.append(plusOne ? "1" : "0")
          plusOne = true

        default: result.append("0")
      }
    }
    return String(result.reversed())
  }
}

// MARK: 344. Reverse String
extension Solution.Easy {
  func reverseString(_ s: inout [Character]) {
    var temp: Character, right = s.count - 1
    for i in 0..<s.count / 2 {
      temp = s[i]
      s[i] = s[right]
      s[right] = temp
      right -= 1
    }
  }
}

// MARK: 345. Reverse Vowels of a String
extension Solution.Easy {
  func reverseVowels(_ s: String) -> String {
    let vowels: Set<Character> = Set(["a", "A", "e", "E", "u", "U", "o", "O", "i", "I"]), vowelsString = s.filter { vowels.contains($0) }
    var result = "", vowelIndex = vowelsString.endIndex
    
    for char in s {
      if vowels.contains(char) {
        vowelIndex = vowelsString.index(before: vowelIndex)
        result.append(vowelsString[vowelIndex])
      } else {
        result.append(char)
      }
    }
    
    return result
  }
}

// MARK: 290. Word Pattern
extension Solution.Easy {
  func wordPattern(_ pattern: String, _ s: String) -> Bool {
    var dict: [Character:String] = [:], letterIndex = pattern.startIndex, currentLetter: Character
    let words = s.components(separatedBy: " ")
    guard words.count == pattern.count else { return false }
    
    for word in words {
      currentLetter = pattern[letterIndex]
      
      if dict[currentLetter] == nil {
        guard !dict.values.contains(word) else { return false }
        dict[currentLetter] = word
      } else {
        guard dict[currentLetter] == word else { return false }
      }
      
      letterIndex = pattern.index(after: letterIndex)
    }
    
    return true
  }
}

// MARK: 1071. Greatest Common Divisor of Strings
extension Solution.Easy {
  func gcdOfStrings(_ str1: String, _ str2: String) -> String {
    var dividable = str1, divider = str2, temp = str2
    
    while !dividable.isEmpty && !divider.isEmpty {
      dividable = str1
      
      if dividable.count % divider.count == 0 {
        while dividable.hasSuffix(divider) {
          dividable.removeLast(divider.count)
        }
      }
      
      guard !dividable.isEmpty else { break }
      dividable = str1
      
      divider.removeLast()
      temp = divider
      
      while !temp.isEmpty && !divider.isEmpty {
        temp = str2
        
        if str2.count % divider.count == 0 {
          while temp.hasSuffix(divider) {
            temp.removeLast(divider.count)
          }
        }
        
        guard !temp.isEmpty else { break }
        divider.removeLast()
      }
    }
    
    return divider
  }
}

// MARK: 771. Jewels and Stones
extension Solution.Easy {
  func numJewelsInStones(_ jewels: String, _ stones: String) -> Int {
    // I
//    var count = 0
//
//    for stone in stones {
//      guard jewels.contains(stone) else { continue }
//      count += 1
//    }
//
//    return count
    
    // II
    stones.filter({ jewels.contains($0) }).count
  }
}

// MARK: 917. Reverse Only Letters
extension Solution.Easy {
  func reverseOnlyLetters(_ s: String) -> String {
    
    // Common
    let uppercaseRange: Range<UInt8> = Range(97...122), lowercaseRange: Range<UInt8> = Range(65...90)
    func isLetter(asciiValue: UInt8) -> Bool {
      uppercaseRange.contains(asciiValue) || lowercaseRange.contains(asciiValue)
    }
    
    // I
//    var s = Array(s), tempChar: Character, leftPointer = s.startIndex, rightPointer = s.index(before: s.endIndex)
//
//    while leftPointer < rightPointer {
//      while !isLetter(asciiValue: s[leftPointer].asciiValue!), leftPointer != s.endIndex {
//        leftPointer = s.index(after: leftPointer)
//      }
//      while !isLetter(asciiValue: s[rightPointer].asciiValue!), rightPointer != s.startIndex {
//        rightPointer = s.index(before: rightPointer)
//      }
//      guard leftPointer < rightPointer else { break }
//
//      tempChar = s[leftPointer]
//      s[leftPointer] = s[rightPointer]
//      s[rightPointer] = tempChar
//
//      leftPointer = s.index(after: leftPointer)
//      rightPointer = s.index(before: rightPointer)
//    }
//
//    return String(s)
    
    // II
    var s = s, letters = s.filter { isLetter(asciiValue: $0.asciiValue!) }
    return String(s.map { isLetter(asciiValue: $0.asciiValue!) ? letters.removeLast() : $0 })
  }
}

// MARK: 925. Long Pressed Name
extension Solution.Easy {
  func isLongPressedName(_ name: String, _ typed: String) -> Bool {
    var nameIndex = name.startIndex, nameCount: Int, typedIndex = typed.startIndex, typedCount: Int, currentCharacter: Character
    let nameUpperBound = name.index(before: name.endIndex), typedUpperBound = typed.index(before: typed.endIndex)
    
    func updateLetters(count: inout Int, in string: String, withIndex index: inout String.Index, and upperBoundIndex: String.Index) {
      while index != upperBoundIndex {
        index = string.index(after: index)
        guard string[index] == currentCharacter else { break }
        count += 1
      }
    }
    
    while nameIndex != nameUpperBound || typedIndex != typedUpperBound {
      guard name[nameIndex] == typed[typedIndex] else { return false }
      currentCharacter = name[nameIndex]
      nameCount = 1
      typedCount = 1
      
      updateLetters(count: &nameCount, in: name, withIndex: &nameIndex, and: nameUpperBound)
      updateLetters(count: &typedCount, in: typed, withIndex: &typedIndex, and: typedUpperBound)
      
      guard nameCount <= typedCount else { return false }
    }
    
    return name[nameIndex] == typed[typedIndex]
  }
}

// MARK: 1876. Substrings of Size Three with Distinct Characters
extension Solution.Easy {
  func countGoodSubstrings(_ s: String) -> Int {
    guard s.count > 2 else { return 0 }
    var count = 0, first = s.startIndex, second = s.index(after: first), third = s.index(after: second), tempSet: Set<Character>
    
    for _ in 0..<s.count - 2 {
      tempSet = [s[first], s[second], s[third]]
      if tempSet.count == 3 {
        count += 1
      }
      first = second
      second = third
      third = s.index(after: third)
    }
    
    return count
  }
}

// MARK: 1221. Split a String in Balanced Strings
extension Solution.Easy {
  func balancedStringSplit(_ s: String) -> Int {
    var result = 0, count = 0, left: Character = s.first!
    
    for char in s {
      if count == 0 {
        left = char
        count += 1
        result += 1
      } else {
        count += left == char ? 1 : -1
      }
    }
    
    return result
  }
}

// MARK: 1154. Day of the Year
extension Solution.Easy {
  func dayOfYear(_ date: String) -> Int {
    let date = date.components(separatedBy: "-").map { Int($0)! }
    let isLeap = date[0] == 1900 ? false : date[0] % 4 == 0
    let months = [1:31, 2: isLeap ? 29 : 28, 3:31, 4:30, 5:31, 6:30, 7:31, 8:31, 9:30, 10:31, 11:30]
    return date[2] + (1..<date[1]).map { months[$0]! }.reduce(0, +)
  }
}

// MARK: 859. Buddy Strings
extension Solution.Easy {
  func buddyStrings(_ s: String, _ goal: String) -> Bool {
    guard s.count == goal.count else { return false }
    var differense: [Character] = [], sIndex = s.startIndex, goalIndex = goal.startIndex
    
    for _ in 0..<s.count {
      if s[sIndex] != goal[goalIndex] {
        differense.append(s[sIndex])
        differense.append(goal[goalIndex])
        guard differense.count < 5 else { return false }
      }
      sIndex = s.index(after: sIndex)
      goalIndex = goal.index(after: goalIndex)
    }
    
    if differense.count == 0 {
      return Set(s).count != s.count
    }
    guard differense.count == 4 else { return false }
    return differense[0] == differense[3] && differense[1] == differense[2]
  }
}

// MARK: 1790. Check if One String Swap Can Make Strings Equal
extension Solution.Easy {
  func areAlmostEqual(_ s1: String, _ s2: String) -> Bool {
    guard s1 != s2 else { return true }
    var differense: [Character] = [], s1Index = s1.startIndex, s2Index = s2.startIndex
    
    for _ in 0..<s1.count {
      if s1[s1Index] != s2[s2Index] {
        differense.append(s1[s1Index])
        differense.append(s2[s2Index])
        guard differense.count < 5 else { return false }
      }
      s1Index = s1.index(after: s1Index)
      s2Index = s2.index(after: s2Index)
    }
    
    guard differense.count == 4 else { return false }
    return differense[0] == differense[3] && differense[1] == differense[2]
  }
}

// MARK: 1832. Check if the Sentence Is Pangram
extension Solution.Easy {
  func checkIfPangram(_ sentence: String) -> Bool {
    // I
//    Set(sentence).count == 26
    
    // II
    var alphabet = Set((Unicode.Scalar("a").value...Unicode.Scalar("z").value))
    sentence.unicodeScalars.forEach { alphabet.remove($0.value) }
    
    return alphabet.isEmpty
  }
}

// MARK: 1678. Goal Parser Interpretation
extension Solution.Easy {
  func interpret(_ command: String) -> String {
    var result = "", temp = "", index = command.startIndex
    
    while index < command.endIndex {
      defer { index = command.index(after: index) }
      guard command[index] != "G" else { result += "G"; continue }
      guard command[index] != "(" else { continue }
      if command[index] == ")" {
        result += "o"
      } else {
        result += "al"
        index = command.index(index, offsetBy: 2)
      }
    }
    return result
  }
}

// MARK: 1704. Determine if String Halves Are Alike
extension Solution.Easy {
  func halvesAreAlike(_ s: String) -> Bool {
    let vowels: Set<Character> = Set(["a", "e", "i", "o", "u", "A", "E", "I", "O", "U"])
    var aIndex: String.Index = s.startIndex, bIndex = s.index(s.startIndex, offsetBy: s.count / 2), count = 0
    
    for _ in 0..<(s.count / 2) {
      if vowels.contains(s[aIndex]) { count += 1 }
      if vowels.contains(s[bIndex]) { count -= 1 }
      aIndex = s.index(after: aIndex)
      bIndex = s.index(after: bIndex)
    }
    
    return count == 0
  }
}

// MARK: 1689. Partitioning Into Minimum Number Of Deci-Binary Numbers
extension Solution.Easy {
  func minPartitions(_ n: String) -> Int {
    // 1
//    var n = n, temp: Int, result = 0
//
//    while !n.isEmpty {
//      temp = n.removeLast().wholeNumberValue!
//      guard temp > result else { continue }
//      result = temp
//      guard temp < 9 else { return 9 }
//    }
//
//    return result
    
    // 2
    n.max()!.wholeNumberValue!
  }
}

// MARK: 1108. Defanging an IP Address
extension Solution.Easy {
  func defangIPaddr(_ address: String) -> String {
    // 1
//    address.replacingOccurrences(of: ".", with: "[.]")
    
    // 2
    var address = address, processedDots = 0, index: String.Index = address.index(address.endIndex, offsetBy: -2)
    
    while processedDots < 3 {
      if address[index] == "." {
        address.insert("]", at: address.index(after: index))
        address.insert("[", at: index)
        guard processedDots < 2 else { return address }
        processedDots += 1
        index = address.index(index, offsetBy: -2)
        continue
      }
      index = address.index(index, offsetBy: -1)
    }

    return address
  }
}

// MARK: 2194. Cells in a Range on an Excel Sheet
extension Solution.Easy {
  func cellsInRange(_ s: String) -> [String] {
    let alphabet = "ABCDEFGHIJKLMNOPQRSTUVWXYZ",
        minNumber = Int(String(s[s.index(after: s.startIndex)]))!, maxNumber = Int(String(s[s.index(before: s.endIndex)]))!
    var result: [String] = [], index = alphabet.firstIndex(of: s[s.startIndex])!,
        endIndex = alphabet.index(after: alphabet.firstIndex(of: s[s.index(s.startIndex, offsetBy: 3)])!),
        letter: Character
    
    while index != endIndex {
      letter = alphabet[index]
      for i in minNumber...maxNumber {
        result.append("\(letter)\(i)")
      }
      index = alphabet.index(after: index)
    }
    
    return result
  }
}

// MARK: 2325. Decode the Message
extension Solution.Easy {
  func decodeMessage(_ key: String, _ message: String) -> String {
    let alphabet = "abcdefghijklmnopqrstuvwxyz"
    var result = "", letter: Character, index = alphabet.startIndex, keyIndex = key.startIndex, table: [Character:Character] = [" ":" "]
    
    while table.count < 27 {
      letter = key[keyIndex]
      if letter != " ", table[letter] == nil {
        table[letter] = alphabet[index]
        index = alphabet.index(after: index)
      }
      keyIndex = key.index(after: keyIndex)
    }
    
    for char in message {
      result.append(table[char]!)
    }
    
    return result
  }
}

// MARK: 1859. Sorting the Sentence
extension Solution.Easy {
  func sortSentence(_ s: String) -> String {
    s.components(separatedBy: " ")
      .sorted { $0.last! < $1.last! }
      .map { $0.dropLast() }
      .joined(separator: " ")
  }
}
