//
//  MediumHashMap.swift
//  Algorithms
//
//  Created by Igor Ratynski on 12.08.2022.
//

import Foundation

// MARK: Length of longest substring
extension Solution.Medium {
  func lengthOfLongestSubstring(_ s: String) -> Int {
    var result = 0, substring = Set<Character>(), tempCount = 0, stringArray: [Character] = s.reversed()

    while !stringArray.isEmpty {
      for index in stride(from: stringArray.count - 1, to: -1, by: -1) {
        tempCount = substring.count
        substring.insert(stringArray[index])

        if substring.count == tempCount {
          if substring.count > result {
            result = substring.count
          }
          substring.removeAll()
          stringArray.removeLast()
          break
        }
      }
    }

    return max(result, tempCount)
  }
}
