//
//  DataStructuresSupporing.swift
//  Algorithms
//
//  Created by Igor Ratynski on 23.08.2022.
//

import Foundation

// MARK: ListNode
extension ListNode: CustomStringConvertible {
  public var description: String {
    var result = "[\(val)"
    var tempNext: ListNode? = next
    while tempNext != nil {
      result += ", \(tempNext!.val)"
      tempNext = tempNext?.next
    }
    result += "]"
    return result
  }
  
  public func show() {
    print("### \(description)")
  }
}
