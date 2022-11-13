//
//  MediumStringTasks.swift
//  Medium
//
//  Created by Igor Ratynski on 20.10.2022.
//

import Foundation

// MARK: 692. Top K Frequent Words
extension Solution.Medium {
  func topKFrequent(_ words: [String], _ k: Int) -> [String] {
    var hashmap: [String:Int] = [:]
    for word in words {
      hashmap[word] = (hashmap[word] ?? 0) + 1
    }
    return hashmap.sorted(by: { $0.value == $1.value ? $0.key < $1.key : $0.value > $1.value })
      .dropLast(hashmap.count - k)
      .map { $0.key }
  }
}

// MARK: 151. Reverse Words in a String
extension Solution.Medium {
  func reverseWords(_ s: String) -> String {
    // I
//    s.components(separatedBy: " ")
//      .filter { !$0.isEmpty }
//      .reversed()
//      .joined(separator: " ")
    
    // II
    var word = "", result: String, results: [String] = []
    
    for char in s {
      if char == " " {
        guard !word.isEmpty else { continue }
        results.append(word)
        word = ""
      } else {
        word.append(char)
      }
    }

    result = word.isEmpty ? results.last! : word

    for i in stride(from: results.count - (word.isEmpty ? 2 : 1), through: 0, by: -1) {
      result += " " + results[i]
    }
    
    return result
  }
}
