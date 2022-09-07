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

// MARK: Longest common prefix
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
