//
//  HardIntArrayTasks.swift
//  Hard
//
//  Created by Igor Ratynski on 23.07.2022.
//

import Foundation

extension Solution.Hard {
  func countSmaller(_ nums: [Int]) -> [Int] {
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
  
  func testCountSmaller() {
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

// MARK: 239. Sliding Window Maximum
extension Solution.Hard {
  func maxSlidingWindow(_ nums: [Int], _ k: Int) -> [Int] {
    let window = Window(nums: nums.dropLast(nums.count - k))
    var result = [window.maxValue]
    
    for i in k..<nums.count {
      window.append(value: nums[i])
      result.append(window.maxValue)
    }
    
    return result
  }
  
  // MARK: Supporting
  
  private class Window {
    
    // MARK: Public
    var maxValue: Int
    
    // MARK: Private
    private let size: Int
    private var maxIndex: Int
    
    // Nodes
    private var headNode: Node
    private var tailNode: Node
    
    init(nums: [Int]) {
      size = nums.count
      
      var max = nums.first!, index = 1
      
      headNode = Node(nums.first!)
      tailNode = headNode
      
      for i in 1..<nums.count {
        tailNode.next = Node(nums[i])
        tailNode = tailNode.next!
        guard max < nums[i] else { continue }
        max = nums[i]
        index = i + 1
      }
      
      maxValue = max
      maxIndex = index
    }
    
    func append(value: Int) {
      headNode.val = value
      tailNode.next = headNode
      
      headNode = headNode.next!
      tailNode = tailNode.next!
      tailNode.next = nil
      
      if value >= maxValue {
        maxValue = value
        maxIndex = size
      } else {
        maxIndex -= 1
        guard maxIndex == 0 else { return }
        recolculate()
      }
      
    }
    
    private func recolculate() {
      var node: Node? = headNode.next, max = headNode.val, index = 1, iterations = 2
      
      while node != nil {
        if max < node!.val {
          max = node!.val
          index = iterations
        }
        if maxValue - 1 <= max { break }
        node = node?.next
        iterations += 1
      }
      
      maxValue = max
      maxIndex = index
    }
  }
  
  private class Node {
    var val: Int
    var next: Node?
    
    init(_ value: Int, next: Node? = nil) {
      self.val = value
      self.next = next
    }
  }
}
