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
      guard count == cache.count else { continue }
      return true
    }
    return false
  }
}

// MARK: Sorted squares
extension Solution.Easy {
  func sortedSquares(_ nums: [Int]) -> [Int] {
      nums.map { $0 * $0 }.sorted()
  }
}

// MARK: Missing number
extension Solution.Easy {
  func missingNumber(_ nums: [Int]) -> Int {
    // I
    /*
    let nums = nums.sorted()
        
    for index in 1..<nums.count {
      guard nums[index - 1] == nums[index] - 1 else { return nums[index - 1] + 1 }
    }
    
    return nums.first! == 0 ? nums.last! + 1 : 0
    */
    // II
    var commonCount = 0, mustCount = 0, minValue = nums.first!
    for (index, value) in nums.enumerated() {
      commonCount += value
      mustCount += index
      guard minValue > value else { continue }
      minValue = value
    }
    if minValue == 1 { return 0 }
    return minValue + nums.count - (commonCount - (minValue * nums.count + mustCount))
  }
}

// MARK: Move zeros
extension Solution.Easy {
  func moveZeroes(_ nums: inout [Int]) {
    for i in 0..<nums.count {
      guard nums[i] == 0 else { continue }
      for j in (i+1)..<nums.count {
        guard nums[j] != 0 else { continue }
        nums[i] = nums[j]
        nums[j] = 0
        break
      }
    }
  }
}

// MARK: Find max consecutive ones
extension Solution.Easy {
  func findMaxConsecutiveOnes(_ nums: [Int]) -> Int {
    var count = 0, tempCount = 0
    
    for number in nums {
      if number == 1 {
        tempCount += 1
      } else {
        if count < tempCount {
          count = tempCount
        }
        tempCount = 0
      }
    }
    
    return max(count, tempCount)
  }
}

