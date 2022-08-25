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

// TODO: is palindrome
extension Solution.Easy {
  func isPalindrome(_ s: String) -> Bool {
//    let a = Array(s.lowercased().replacingOccurrences(of:"[^0-9a-z]", with: "", options: .regularExpression))
//
//    var max = a.count - 1
//    for index in 0..<a.count / 2 {
//      if a[index] == a[max] {
//        max -= 1
//      } else {
//        return false
//      }
//    }
    
//    var a = s.lowercased().replacingOccurrences(of:"[^0-9a-z]", with: "", options: .regularExpression)
//
//    while true {
//      if a.removeFirst() != a.removeLast() {
//        return false
//      }
//    }
    return true
  }
}

// TODO: Valid polindrome
extension Solution.Easy {
  func validPalindrome(_ s: String) -> Bool {
    var firstPtr = 0, secondPtr = s.count - 1, fails = 0
    let s = s.utf8CString
    
    while firstPtr < secondPtr {
      print("# 1: \(s[firstPtr]) c: \(firstPtr), 2: \(s[secondPtr]) c: \(secondPtr)")
      if s[firstPtr] != s[secondPtr] {
//        if fails == 0 && secondPtr - firstPtr > 1 {
//          fails += 1
//        } else {
//          return secondPtr - firstPtr < 2
//        }
        if secondPtr + 1 - firstPtr - 1 >= 0 {
          fails += 1
        } else {
          return secondPtr - firstPtr < 2
        }
      }
      firstPtr += 1
      secondPtr -= 1
    }
    
    return true
  }
}

// TODO: Letter combinations
extension Solution.Easy {
  func testLetterCombinations() {
    let s = "2232"
    
    print(letterCombinations(s))
////    let didgitLetters: [String : String] = ["2":"abc", "3":"def", "4":"ghi", "5":"jkl", "6":"mno", "7":"pqrs", "8":"tuv", "9":"xyz"]
//    let didgitLetters: [String : [String]] = ["2": ["a","b","c"], "3":["d","e","f"], "4":["g","h","i"], "5":["j","k","l"], "6":["m","n","o"], "7":["p","q","r","s"], "8":["t","u","v"], "9":["x","y","z"]]
  }
    
    struct DidgitsEnumerator {
      let didgitLetters: [String : [String]] = ["2":["a","b","c"], "3":["d","e","f"],     "4":["g","h","i"], "5":["j","k","l"],
                                                "6":["m","n","o"], "7":["p","q","r","s"], "8":["t","u","v"], "9":["x","y","z"]]
      
      var value: String {
        var result = ""
  //      didgitLetters.map { $0.key[$0.value] }
        for index in 0..<counterArray.count {
          result.append(counterArray[index][indexesArray[index]])
        }
        
//        counterArray.map { $0 }
        
        return result
      }
      
      var currentIndex: Int

      private var counterArray: [[String]] = []
      private var indexesArray: [Int] = []
      
      init(digits: String) {
  //      counterArray = digits.map { [String($0) : didgitLetters[String($0)]!] }
        currentIndex = digits.count - 1
        for digit in digits.reversed() {
          let digitsArray = didgitLetters[String(digit)]!
          
          counterArray.append(digitsArray)
          indexesArray.append(digitsArray.count - 1)
        }
        
        // TODO: index iteration
//        if indexesArray[currentIndex]
        
        print("counterArray: \(counterArray)")
      }
    }
//  static let didgitLetters: [Int : String] = [2:"abc", 3:"def", 4:"ghi", 5:"jkl", 6:"mno", 7:"pqrs", 8:"tuv", 9:"xyz"]
//    static let didgitLetters: [String : String] = ["2":"abc", "3":"def", "4":"ghi", "5":"jkl", "6":"mno", "7":"pqrs", "8":"tuv", "9":"xyz"]
  func letterCombinations(_ digits: String) -> [String] {
    DidgitsEnumerator(digits: digits)
    return []
  }
}
//["aaaa","aaab","aaac","aaba","aabb","aabc","aaca","aacb","aacc","abaa","abab","abac","abba","abbb","abbc","abca","abcb","abcc","acaa","acab","acac","acba","acbb","acbc","acca","accb","accc",
//     "baaa","baab","baac","baba","babb","babc","baca","bacb","bacc","bbaa","bbab","bbac","bbba","bbbb","bbbc","bbca","bbcb","bbcc","bcaa","bcab","bcac","bcba","bcbb","bcbc","bcca","bccb","bccc","caaa","caab","caac","caba","cabb","cabc","caca","cacb","cacc","cbaa","cbab","cbac","cbba","cbbb","cbbc","cbca","cbcb","cbcc","ccaa","ccab","ccac","ccba","ccbb","ccbc","ccca","cccb","cccc"]

