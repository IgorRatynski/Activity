//
//  EasyHashMapTasks.swift
//  Easy
//
//  Created by Igor Ratynski on 10.09.2022.
//

import Foundation

// MARK: 706. Design HashMap
extension Solution.Easy {
  class MyHashMap {
    
    // MARK: Private properties
    var keys: [Int] = []
    var values: [Int] = []
    
    // MARK: Functions
    func put(_ key: Int, _ value: Int) {
      if keys.contains(key) {
        let index = keys.firstIndex(of: key)!
        values[index] = value
      } else {
        keys.append(key)
        values.append(value)
      }
    }
    
    func get(_ key: Int) -> Int {
      guard keys.contains(key) else { return -1 }
      let index = keys.firstIndex(of: { $0 == key })
      return values[index]
    }
    
    func remove(_ key: Int) {
      guard keys.contains(key) else { return }
      let index = keys.firstIndex(of: { $0 == key })
      keys.remove(at: index!)
      values.remove(at: index!)
    }
  }
}
