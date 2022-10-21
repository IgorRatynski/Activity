//
//  MediumIntTasks.swift
//  Medium
//
//  Created by Igor Ratynski on 02.12.2022.
//

import Foundation

// MARK: 12. Integer to Roman
extension Solution.Medium {
  
  // max  mid low     unit
  // 10   5           1
  // 100  50          10
  // 1000 500         100

  // "1 5 '10" 50 "100' 500 1000" + 2
  //  u mid max
  //        u mid max
  //              u mid max
  
  func intToRoman(_ num: Int) -> String {
    let romans = ["I", "V", "X", "L", "C", "D", "M"]
    var result = "", num = num, unit = 0, mid = 1, max = 2
    
    func roman(from number: Int) -> String {
      switch number {
        case 1...3: return "".updated(by: romans[unit], with: number % 5)
        case 4...8: return romans[mid].updated(by: romans[unit], with: number % 5)
        case 9: return romans[max].updated(by: romans[unit], with: number % 5)
        default: return "" // case ...0
      }
    }
    
    while num > 0 {
      result = roman(from: num % 10) + result
      num /= 10
      unit += 2
      mid += 2
      max += 2
    }
    
    return result
  }
}

private extension String {
  func updated(by unit: String, with number: Int) -> String {
    let fromLeft = number > 3
    let element = String(repeating: unit, count: number.countOfUnints(fromLeft: fromLeft))
    return fromLeft ? element + self : self + element
  }
}

private extension Int {
  func countOfUnints(fromLeft: Bool) -> Int {
    fromLeft ? self - 3 : self
  }
}

// MARK: 2396. Strictly Palindromic Number
extension Solution.Medium {
  func isStrictlyPalindromic(_ n: Int) -> Bool {
    // I
//    var startIndex: String.Index, endIndex: String.Index, based: String
//
//    for i in 2...n-2 {
//      based = String(n, radix: i)
//      startIndex = based.startIndex
//      endIndex = based.index(before: based.endIndex)
//
//      for _ in 0..<based.count / 2 {
//        guard based[startIndex] == based[endIndex] else { return false }
//        startIndex = based.index(after: startIndex)
//        endIndex = based.index(before: endIndex)
//      }
//    }
//
//    return true
    
    // II
    false
  }
}
