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
    var n = n, tempResult: Int, tempLast: Int
    var cache = Set<Int>()
    
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

// TODO: Descending order
extension Solution.Easy {
//  func descendingOrder(of number: Int) -> Int {
////    Int(String(number).sorted(by: { Int($0) > Int($1) }))
//    String(number).sorted(by: { Int($0) > Int($1) })
////    let string = String(
//
//  }
}

// MARK: Supporting: climb stairs, fibonacci n
private extension Solution.Easy {
  func fibonacciRecursive(num1: Int, num2: Int, steps: Int) -> Int {
    steps > 0 ? fibonacciRecursive(num1: num2, num2: num1 + num2, steps: steps - 1) : num1
  }
}
