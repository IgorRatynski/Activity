//
//  EasyStringTasks.swift
//  Easy
//
//  Created by Igor Ratynski on 22.07.2022.
//

import Foundation

extension Solution.Easy {
  static func isPalindrome(_ s: String) -> Bool {
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
    
    var a = s.lowercased().replacingOccurrences(of:"[^0-9a-z]", with: "", options: .regularExpression)
    
    while true {
      if a.removeFirst() != a.removeLast() {
        return false
      }
    }
    return true
  }
  
  static func testIsPalindromeString() {
    var s = "A man, a plan, a canal: Panama"
    print(isPalindrome(s))
    s = "race a car"
    print(isPalindrome(s))
    s = " "
    print(isPalindrome(s))
  }
}

// MARK: Valip polindrome
extension Solution.Easy {
  static func validPalindrome(_ s: String) -> Bool {
    var firstPtr = 0
    var secondPtr = s.count - 1
    let s = s.utf8CString
    var fails = 0
    
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
  
  static func testIsValindromeString() {
    var s = "abcddffcba"
//    var s = "abc"
    print(validPalindrome(s))
//    s = "abcddfcba"
//    print(validPalindrome(s))
//    s = "abcdddcba"
//    print(validPalindrome(s))
  }
}

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
//      if addToNext {
//        addToNext = false
//      }
      
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
    var result = Array<Character?>(repeating: nil, count: s.count)
    for (index, item) in s.enumerated() {
      result[indices[index]] = item
    }
    return String(result.compactMap { $0 })
  }
}
