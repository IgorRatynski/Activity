//
//  EasyIntTasks.swift
//  Easy
//
//  Created by Igor Ratynski on 22.07.2022.
//

import Foundation

// MARK: Is happy
extension Solution.Easy {
  func isHappy(_ n: Int) -> Bool {
    var n = n, tempResult: Int, tempLast: Int, cache = Set<Int>()
    
    while !cache.contains(n) {
      if n == 1 {
        return true
      } else {
        cache.insert(n)
      }
      
      tempResult = 0
      while n > 9 {
        tempLast = n % 10
        n = n / 10
        tempResult += tempLast * tempLast
      }
      
      tempResult += n * n
      n = tempResult
    }
    
    return false
  }
}

// MARK: Climb stairs
extension Solution.Easy {
  func climbStairs(_ n: Int) -> Int {
    fibonacciRecursive(num1: 1, num2: 1, steps: n)
  }
}

// MARK: Fibonacci n
extension Solution.Easy {
  func fib(_ n: Int) -> Int {
    fibonacciRecursive(num1: 0, num2: 1, steps: n)
  }
}

// MARK: Supporting: climb stairs, fibonacci n
private extension Solution.Easy {
  func fibonacciRecursive(num1: Int, num2: Int, steps: Int) -> Int {
    steps > 0 ? fibonacciRecursive(num1: num2, num2: num1 + num2, steps: steps - 1) : num1
  }
}

// MARK: Generate Pascal's triangle I
extension Solution.Easy {
  func generate(_ numRows: Int) -> [[Int]] {
    guard numRows > 1 else { return [[1]] }
    var result: [[Int]] = [[1], [1,1]], temp: [Int], prev: Int
    
    for iteration in 2..<numRows {
      prev = iteration - 1
      temp = [1]
      for lineIndex in 1..<iteration {
        // TODO: optimization: count a half of line after get values
        temp.append(result[prev][lineIndex - 1] + result[prev][lineIndex])
      }
      temp.append(1)
      result.append(temp)
    }
    
    return result
  }
}

// MARK: Generate Pascal's triangle II
extension Solution.Easy {
  func getRow(_ rowIndex: Int) -> [Int] {
    guard rowIndex > 0 else { return [1] }
    var result = [[1], [1,1]], temp: [Int]
    
    for iteration in 2..<rowIndex + 1 {
      result[0] = result[1]
      temp = [1]
      // TODO: optimization: count a half of line after get values
      for lineIndex in 1..<iteration {
        temp.append(result[0][lineIndex - 1] + result[0][lineIndex])
      }
      temp.append(1)
      result[1] = temp
    }
    
    return result.last!
  }
}

// MARK: Check ones segment
extension Solution.Easy {
  func checkOnesSegment(_ s: String) -> Bool {
    var filter = "01"
    for current in s {
      guard current == filter.first else { continue }
      filter.removeFirst()
      guard !filter.isEmpty else { return false }
    }
    
    return true
  }
}

// MARK: Max power
extension Solution.Easy {
  func maxPower(_ s: String) -> Int {
    var s = s, current = s.removeFirst(), count = 0, tempCount = 1
    
    for char in s {
      if char == current {
        tempCount += 1
      } else {
        if count < tempCount {
          count = tempCount
        }
        tempCount = 1
        current = char
      }
    }
    
    return max(count, tempCount)
  }
}

// MARK: 728. Self dividing numbers
extension Solution.Easy {
  func selfDividingNumbers(_ left: Int, _ right: Int) -> [Int] {
    var string: String, result: [Int] = [], isValid: Bool
    for number in left...right {
      isValid = true
      string = String(number)
      guard !string.contains("0") else { continue }
      while !string.isEmpty {
        guard number % Int(String(string.removeLast()))! != 0 else { continue }
        isValid = false
        break
      }
      
      guard isValid else { continue }
      result.append(number)
    }
    
    return result
  }
}
