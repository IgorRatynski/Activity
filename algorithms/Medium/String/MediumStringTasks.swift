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
