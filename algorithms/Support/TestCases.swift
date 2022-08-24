//
//  TestCases.swift
//  Algorithms
//
//  Created by Igor Ratynski on 23.08.2022.
//

import Foundation

// MARK: ListNode
public extension ListNode {
  static var testCases1: ListNode? {
    ListNode(1)
  }
  static var testCases2: ListNode? {
    ListNode(1, ListNode(2))
  }
  static var testCases3: ListNode? {
    ListNode(1, ListNode(2, ListNode(3)))
  }
  static var testCases4: ListNode? {
    ListNode(1, ListNode(2, ListNode(3, ListNode(4))))
  }
  static var testCases5: ListNode? {
    ListNode(1, ListNode(2, ListNode(3, ListNode(4, ListNode(5)))))
  }
  static var testCases6: ListNode? {
    ListNode(1, ListNode(2, ListNode(3, ListNode(4, ListNode(5, ListNode(6))))))
  }
  static var testCases7: ListNode? {
    ListNode(1, ListNode(2, ListNode(3, ListNode(4, ListNode(5, ListNode(6, ListNode(7)))))))
  }
  
  static var testCases22: ListNode? {
    ListNode(1, ListNode(2, ListNode(3, ListNode(4, ListNode(5, ListNode(6, ListNode(7, ListNode(8, ListNode(9, ListNode(10, ListNode(11, ListNode(12, ListNode(13, ListNode(14, ListNode(15, ListNode(16, ListNode(17, ListNode(18, ListNode(19, ListNode(20, ListNode(21, ListNode(22))))))))))))))))))))))
  }
  static var testCases23: ListNode? {
    ListNode(1, ListNode(2, ListNode(3, ListNode(4, ListNode(5, ListNode(6, ListNode(7, ListNode(8, ListNode(9, ListNode(10, ListNode(11, ListNode(12, ListNode(13, ListNode(14, ListNode(15, ListNode(16, ListNode(17, ListNode(18, ListNode(19, ListNode(20, ListNode(21, ListNode(22, ListNode(23)))))))))))))))))))))))
  }
  static var testCases24: ListNode? {
    ListNode(1, ListNode(2, ListNode(3, ListNode(4, ListNode(5, ListNode(6, ListNode(7, ListNode(8, ListNode(9, ListNode(10, ListNode(11, ListNode(12, ListNode(13, ListNode(14, ListNode(15, ListNode(16, ListNode(17, ListNode(18, ListNode(19, ListNode(20, ListNode(21, ListNode(22, ListNode(23, ListNode(24))))))))))))))))))))))))
  }
  static var testCases25: ListNode? {
    ListNode(1, ListNode(2, ListNode(3, ListNode(4, ListNode(5, ListNode(6, ListNode(7, ListNode(8, ListNode(9, ListNode(10, ListNode(11, ListNode(12, ListNode(13, ListNode(14, ListNode(15, ListNode(16, ListNode(17, ListNode(18, ListNode(19, ListNode(20, ListNode(21, ListNode(22, ListNode(23, ListNode(24, ListNode(25)))))))))))))))))))))))))
  }
}
