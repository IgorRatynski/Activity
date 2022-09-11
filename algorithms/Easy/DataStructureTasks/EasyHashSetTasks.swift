//
//  EasyHashSetTasks.swift
//  Easy
//
//  Created by Igor Ratynski on 11.09.2022.
//

import Foundation

// MARK: 705. Design HashSet
extension Solution.Easy {
  class MyHashSet {
    
    // MARK: Private properties
    private var storage: [Int] = []
    
    // MARK: Functions
    func add(_ key: Int) {
      guard !storage.contains(key) else { return }
      storage.append(key)
    }
    
    func remove(_ key: Int) {
      guard let index = storage.firstIndex(of: key) else { return }
      storage.remove(at: index)
    }
    
    func contains(_ key: Int) -> Bool {
      storage.contains(key)
    }
  }
}
