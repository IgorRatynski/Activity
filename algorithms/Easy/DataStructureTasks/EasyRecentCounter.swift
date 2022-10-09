//
//  EasyRecentCounter.swift
//  Easy
//
//  Created by Igor Ratynski on 09.10.2022.
//

import Foundation

// MARK: 933. Number of Recent Calls
extension Solution.Easy {
  class RecentCounter {
    
    // MARK: Properties
    private var storage: [Int] = []
    private var lastCallPtr = 0
    
    // MARK: Functions
    func ping(_ t: Int) -> Int {
      storage.append(t)
      guard t > 3000 else { return storage.count }
      let value = t - 3000
      while storage[lastCallPtr] < value {
        lastCallPtr += 1
      }
      return storage.count - lastCallPtr
    }
  }
}
