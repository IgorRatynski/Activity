//
//  MediumBinaryTreeTasks.swift
//  Algorithms
//
//  Created by Igor Ratynski on 07.12.2022.
//

import Foundation

// MARK: 1315. Sum of Nodes with Even-Valued Grandparent
extension Solution.Medium {
  func sumEvenGrandparent(_ root: TreeNode?) -> Int {
    guard root != nil else { return 0 }
    guard root!.val % 2 == 0 else { return sumEvenGrandparent(root?.left) + sumEvenGrandparent(root?.right) }
    return (root?.left?.left?.val ?? 0) + (root?.left?.right?.val ?? 0) +
           (root?.right?.left?.val ?? 0) + (root?.right?.right?.val ?? 0) +
           sumEvenGrandparent(root?.left) + sumEvenGrandparent(root?.right)
  }
}

// MARK: 1026. Maximum Difference Between Node and Ancestor
extension Solution.Medium {
  func maxAncestorDiff(_ root: TreeNode?) -> Int {
    guard let root = root else { return 0 }
    
    var result = 0
    getDiff(from: root, minValue: root.val, maxValue: root.val, and: &result)
    return result
  }
  
  private func getDiff(from root: TreeNode?, minValue: Int, maxValue: Int, and result: inout Int) {
    guard let root = root else { return }
    
    let minValue = min(root.val, minValue), maxValue = max(root.val, maxValue),
        diff = max(abs(minValue - root.val), abs(maxValue - root.val))
    result = max(result, diff)
    
    getDiff(from: root.left, minValue: minValue, maxValue: maxValue, and: &result)
    getDiff(from: root.right, minValue: minValue, maxValue: maxValue, and: &result)
  }
}
