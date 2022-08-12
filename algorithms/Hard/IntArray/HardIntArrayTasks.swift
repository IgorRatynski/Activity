//
//  HardIntArrayTasks.swift
//  Hard
//
//  Created by Igor Ratynski on 23.07.2022.
//

import Foundation

extension Solution.Hard {
  static func countSmaller(_ nums: [Int]) -> [Int] {
//    var result: [Int] = []
//    var count: Int
//    for leftComparableIndex in 0..<nums.count {
//      count = 0
//      for rightComparableIndex in (leftComparableIndex + 1)..<nums.count {
//        if nums[leftComparableIndex] > nums[rightComparableIndex] {
//          count += 1
//        }
//      }
//      result.append(count)
//    }
//    return result
    
    var result: [Int:[Int]] = [:]
    var currentCount: [Int:Int] = [:]
    var groupCount = 0
    let partsCount = 2
    let onePart = nums.count / partsCount
    
    let syncGroup = DispatchGroup()
    for groupIndex in 0..<partsCount {
      syncGroup.enter()
      DispatchQueue.global(qos: .userInteractive).async {
        for leftComparableIndex in groupCount * onePart..<nums.count {
          currentCount[groupCount] = 0
          for rightComparableIndex in (leftComparableIndex + 1)..<nums.count {
            if nums[leftComparableIndex] > nums[rightComparableIndex] {
              currentCount[groupCount]! += 1
            }
          }
          result[groupCount]?.append(currentCount[groupCount]!)
        }
        syncGroup.leave()
      }
      groupCount += 1
    }
    
    syncGroup.wait()
    syncGroup.notify(queue: .main) {
      syncGroup.resume()
      print("### result: \(result)")
      print("###")
    }
    
    return result.values.flatMap {$0}
  }
  
  static func testCountSmaller() {
//    let filePath = Bundle.main.path(forResource: "LongTextCase", ofType: "txt")!
//    var data     = try! Data(contentsOf: URL(fileURLWithPath: filePath))
//
//    let nums = String(data: data, encoding: .utf8)
//
//    print(nums)
    
    let nums = [5,2,6,1] // [2,1,1,0]
    let result = countSmaller(nums)
    
    print(result)
  }
}
