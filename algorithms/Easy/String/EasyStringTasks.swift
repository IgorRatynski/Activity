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
