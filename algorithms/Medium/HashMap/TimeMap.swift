//
//  TimeMap.swift
//  Medium
//
//  Created by Igor Ratynski on 07.10.2022.
//

import Foundation

class TimeMap {
  
  private var storage: [String:String] = [:]
  private var timestampStorage: [String:[Int]] = [:]
  
  func set(_ key: String, _ value: String, _ timestamp: Int) {
    storage[key + String(timestamp)] = value
    guard timestampStorage[key] != nil else { return timestampStorage[key] = [timestamp] }
    timestampStorage[key]!.append(timestamp)
  }
  
  func get(_ key: String, _ timestamp: Int) -> String {
    guard storage[key + String(timestamp)] == nil else { return storage[key + String(timestamp)]! }
    if let timestamps = timestampStorage[key] {
      for i in stride(from: timestamps.count - 1, through: 0, by: -1) {
        guard timestamps[i] <= timestamp else { continue }
        return storage[key + String(timestamps[i])]!
      }
    }
    return ""
  }
}
