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

// MARK: 74. Search a 2D Matrix
extension Solution.Medium {
  func searchMatrix(_ matrix: [[Int]], _ target: Int) -> Bool {
    var p: Int?

    for i in 0..<matrix.count {
      guard matrix[i].first! <= target && target <= matrix[i].last! else { continue }
      p = i
      break
    }
    guard let p = p else { return false }

    var low = 0, high = matrix[p].count - 1, mid: Int

    while low <= high {
      mid = (low + high) / 2
      if matrix[p][mid] > target {
        high = mid - 1
      } else if matrix[p][mid] < target {
        low = mid + 1
      } else {
        return true
      }
    }

    return false
  }
}

// MARK: 33. Search in Rotated Sorted Array
extension Solution.Medium {
  func search(_ nums: [Int], _ target: Int) -> Int {
    guard !nums.isEmpty else { return -1 }
    var low = 0, high = nums.count - 1, mid: Int

    while low < high {
      mid = (low + high) / 2
      if nums[mid] > nums[high] {
        low = mid + 1
      } else {
        high = mid
      }
    }

    let pivot = low
    low = 0
    high = nums.count - 1

    if target >= nums[pivot] && target <= nums[high] {
      low = pivot
    } else {
      high = pivot
    }

    while low <= high {
      mid = (low + high) / 2

      if target > nums[mid] {
        low = mid + 1
      } else if target < nums[mid] {
        high = mid - 1
      } else {
        return mid
      }
    }

    return -1
  }
}

// MARK: 11. Container With Most Water
extension Solution.Medium {
  func maxArea(_ height: [Int]) -> Int {
    var l = 0, r = height.count - 1, result = 0, waterAmount: Int, value: Int, maxValue = 10000, breakCycle = false
    
    while l < r {
      
      if height[l] <= height[r] {
        value = height[l]
        breakCycle = value == maxValue && height[r] == maxValue
        l += 1
      } else {
        value = height[r]
        breakCycle = value == maxValue && height[r] == maxValue
        r -= 1
      }
      
      waterAmount = value * (r - l + 1)
      
      if waterAmount > result {
        result = waterAmount
      }
      
      guard !breakCycle else { break }
    }
    
    return result
  }
}

// MARK: 54. Spiral Matrix
extension Solution.Medium {
  func spiralOrder(_ matrix: [[Int]]) -> [Int] {
    guard matrix[0].count > 1 else { return matrix.map { $0.first! } }
    var directions = [true, true], currentDirection = 0, result: [Int] = [], horizontalPointer = 0, verticalPointer = 0, leftLimit = 0, rightLimit = matrix[0].count - 1, upLimit = 1, downLimit = matrix.count - 1
    result.append(matrix[verticalPointer][horizontalPointer])
    
    for _ in 2...(matrix.count * matrix[0].count) {
      if currentDirection == 0 {
        horizontalPointer += directions[currentDirection] ? 1 : -1
        
        if directions[currentDirection] {
          if horizontalPointer == rightLimit {
            directions[currentDirection] = !directions[currentDirection]
            currentDirection = currentDirection == 0 ? 1 : 0
            rightLimit -= 1
          }
        } else {
          if horizontalPointer == leftLimit {
            directions[currentDirection] = !directions[currentDirection]
            currentDirection = currentDirection == 0 ? 1 : 0
            leftLimit += 1
          }
        }
        
      } else {
        verticalPointer += directions[currentDirection] ? 1 : -1
        
        if directions[currentDirection] {
          if verticalPointer == downLimit {
            directions[currentDirection] = !directions[currentDirection]
            currentDirection = currentDirection == 0 ? 1 : 0
            downLimit -= 1
          }
        } else {
          if verticalPointer == upLimit {
            directions[currentDirection] = !directions[currentDirection]
            currentDirection = currentDirection == 0 ? 1 : 0
            upLimit += 1
          }
        }
      }
      result.append(matrix[verticalPointer][horizontalPointer])
    }
    
    return result
  }
}

// MARK: 347. Top K Frequent Elements
extension Solution.Medium {
  func topKFrequent(_ nums: [Int], _ k: Int) -> [Int] {
    var map: [Int:Int] = [:]
    
    for num in nums {
      map[num] = (map[num] ?? 0) + 1
    }
    
    return map.sorted { $0.value > $1.value }
              .dropLast(map.count - k)
              .map { $0.key }
  }
}

// MARK: 122. Best Time to Buy and Sell Stock II
extension Solution.Medium {
  func maxProfit(_ prices: [Int]) -> Int {
    var result = 0

    for i in 1..<prices.count {
      guard prices[i-1] < prices[i] else { continue }
      result += prices[i] - prices[i-1]
   }

   return result
  }
}

// MARK: 1833. Maximum Ice Cream Bars
extension Solution.Medium {
    func maxIceCream(_ costs: [Int], _ coins: Int) -> Int {
      var result = 0, coins = coins
      for cost in costs.sorted(by: { $0 < $1 }) {
        guard coins >= cost else { return result }
        coins -= cost
        result += 1
      }
      return result
    }
}

// MARK: 153. Find Minimum in Rotated Sorted Array
extension Solution.Medium {
  func findMin(_ nums: [Int]) -> Int {
    var low = 0, high = nums.count - 1, mid: Int
    
    while low < high {
      mid = (low + high) / 2
      if nums[mid] > nums[high] {
        low = mid + 1
      } else {
        high = mid
      }
    }
    
    return nums[low]
  }
}
