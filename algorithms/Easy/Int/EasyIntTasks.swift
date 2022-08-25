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
