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
