//
//  DataStructures.swift
//  Algorithms
//
//  Created by Igor Ratynski on 17.07.2022.
//

import Foundation

// MARK: ListNode
public class ListNode {
  public var val: Int
  public var next: ListNode?
  public init() { self.val = 0; self.next = nil; }
  public init(_ val: Int) { self.val = val; self.next = nil; }
  public init(_ val: Int, _ next: ListNode?) { self.val = val; self.next = next; }
}

extension ListNode: Equatable {
  public static func == (lhs: ListNode, rhs: ListNode) -> Bool {
    guard lhs.val == rhs.val else { return false }
    var lhs: ListNode? = lhs.next, rhs: ListNode? = rhs.next
    while lhs != nil {
      guard lhs?.val == rhs?.val else { return false }
      lhs = lhs?.next
      rhs = rhs?.next
    }
    
    return true
  }
}

// MARK: - TreeNode
public class TreeNode {
  public var val: Int
  public var left: TreeNode?
  public var right: TreeNode?
  public init() { self.val = 0; self.left = nil; self.right = nil; }
//  public init(_ val: Int) { self.val = val; self.left = nil; self.right = nil; }
  public init(_ val: Int, _ left: TreeNode? = nil, _ right: TreeNode? = nil) {
    self.val = val
    self.left = left
    self.right = right
  }
}
