//
//  EasyIntArrayTasks.swift
//  Algorithms
//
//  Created by Igor Ratynski on 23.07.2022.
//

import Foundation

// MARK: Good pairs
extension Solution.Easy {
  func numIdenticalPairs(_ nums: [Int]) -> Int {
    var result = 0

    for indexI in 0..<(nums.count - 1) {
      for indexJ in (indexI + 1)..<nums.count {
        guard nums[indexI] == nums[indexJ] else { continue }
        result += 1
      }
    }
    
    return result
  }
}

// MARK: Single number
extension Solution.Easy {
  func singleNumber(_ nums: [Int]) -> Int {
    var result: [Int] = [], cache: [Int:Int] = [:]
    
    for value in nums {
      cache[value] = (cache[value] ?? 0) + 1
      if cache[value] == 1 {
        result.append(value)
      } else {
        guard let index = result.firstIndex(of: value) else { continue }
        result.remove(at: index)
      }
    }
    
    return result.first!
  }
}

// MARK: Contains duplicate
extension Solution.Easy {
  func containsDuplicate(_ nums: [Int]) -> Bool {
//    // I
//    Set(nums).count != nums.count
//    // II
    var cache = Set<Int>(), count: Int
    for num in nums {
      count = cache.count
      cache.insert(num)
      guard count != cache.count else { continue }
      return true
    }
    return false
  }
}

// TODO: Merge
extension Solution.Easy {
  func merge(_ nums1: inout [Int], _ m: Int, _ nums2: [Int], _ n: Int) {
    guard m > 0, n > 0 else {
      if n > 0 {
        nums1 = nums2
      }
      return
    }
    var inoutPointer = m + n - 1, m = max(m - 1, 0), n = max(n - 1, 0)
    
    while inoutPointer > -1 {
      if nums1[m] < nums2[n] {
        nums1[inoutPointer] = nums2[n]
        
        n = max(0, n - 1)
      } else {
        nums1[inoutPointer] = nums1[m]
        nums1[m] = 0
        m = max(0, m - 1)
      }
      
      inoutPointer -= 1
    }
  }
}


// TODO: Contains nearby duplicate
//extension Solution.Easy {
//  func containsNearbyDuplicate(_ nums: [Int], _ k: Int) -> Bool {
//
//  }
//}
