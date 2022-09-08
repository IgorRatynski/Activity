//
//  MediumIntArrayTasks.swift
//  Medium
//
//  Created by Igor Ratynski on 13.08.2022.
//

import Foundation

// MARK: Interchangeable rectangles
extension Solution.Medium {
  func interchangeableRectangles(_ rectangles: [[Int]]) -> Int {
    var result = 0, degree: Float, tempDegree: Float

    var cache: [Int : Float] = [:]

    for indexI in 0..<(rectangles.count - 1) {
      if cache[indexI] != nil {
        degree = cache[indexI]!
      } else {
        degree = Float(rectangles[indexI][1]) / Float(rectangles[indexI][0])
        cache[indexI] = degree
      }
      for indexJ in (indexI + 1)..<rectangles.count {
        if cache[indexJ] != nil {
          tempDegree = cache[indexJ]!
        } else {
          tempDegree = Float(rectangles[indexJ][1]) / Float(rectangles[indexJ][0])
          cache[indexJ] = tempDegree
        }
        guard degree == tempDegree else { continue }
        result += 1
      }
    }

    return result
    // working version:
//    var pairs = 0
//
//    guard 0 < rectangles.count else { return pairs }
//
//    let sortedRatios = rectangles.map { Double($0[0]) / Double($0[1]) }.sorted()
//
//    var prevRatio: Double? = nil
//    var counter = 0
//
//    for curRatio in sortedRatios {
//      if prevRatio == nil || Double.ulpOfOne < fabs(curRatio - prevRatio!) {
//        pairs += counter * (counter - 1) / 2
//
//        prevRatio = curRatio
//        counter = 1
//      } else {
//        counter += 1
//      }
//    }
//
//    pairs += counter * (counter - 1) / 2
//
//    return pairs
  }
}

// MARK: 56. Merge intervals
extension Solution.Medium {
  func merge(_ intervals: [[Int]]) -> [[Int]] {
    let intervals = intervals.sorted { $0[0] == $1[0] ? $0[1] < $1[1] : $0[0] < $1[0] }
    var current: [Int] = intervals.first!, result: [[Int]] = []
    
    for index in 1..<intervals.count {
      if current[1] >= intervals[index][0] {
        current[0] = min(current[0], intervals[index][0])
        current[1] = max(current[1], intervals[index][1])
        
      } else {
        result.append(current)
        current = intervals[index]
      }
    }
    result.append(current)
    
    return result
  }
}
