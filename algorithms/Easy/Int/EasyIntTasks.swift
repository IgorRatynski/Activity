//
//  EasyIntTasks.swift
//  Easy
//
//  Created by Igor Ratynski on 22.07.2022.
//

import Foundation

extension Solution.Easy {
//  func descendingOrder(of number: Int) -> Int {
////    Int(String(number).sorted(by: { Int($0) > Int($1) }))
//    String(number).sorted(by: { Int($0) > Int($1) })
////    let string = String(
//    
//  }
  
  func testDescendingOrder() {
    
//          XCTAssertEqual(descendingOrder(of: 0), 0)
//          XCTAssertEqual(descendingOrder(of: 15), 51)
//          XCTAssertEqual(descendingOrder(of: 123456789), 987654321)
      }
}

// MARK: - isHappy
extension Solution.Easy {
  static func isHappy(_ n: Int) -> Bool {
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
