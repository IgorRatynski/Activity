//
//  EasyBinaryTreeTasks.swift
//  Easy
//
//  Created by Igor Ratynski on 12.08.2022.
//

import Foundation

// MARK: Check tree
extension Solution.Easy {
  func checkTree(_ root: TreeNode?) -> Bool {
    root?.val ?? 0 == (root?.left?.val ?? 0) + (root?.right?.val ?? 0)
  }
}

// MARK: 872. Leaf-Similar Trees
extension Solution.Easy {
  func leafSimilar(_ root1: TreeNode?, _ root2: TreeNode?) -> Bool {
    func getLeafs(from root: TreeNode?, to array: inout [Int]) {
      guard let root = root else { return }
      
      if root.left == nil && root.right == nil {
        array.append(root.val)
      }
      
      getLeafs(from: root.left, to: &array)
      getLeafs(from: root.right, to: &array)
    }
    
    var leftLeafs: [Int] = [], rightLeafs: [Int] = []
    
    getLeafs(from: root1, to: &leftLeafs)
    getLeafs(from: root2, to: &rightLeafs)
    
    return leftLeafs == rightLeafs
  }
}

// MARK: 100. Same Tree
extension Solution.Easy {
  func isSameTree(_ p: TreeNode?, _ q: TreeNode?) -> Bool {
    guard let p = p, let q = q else { return p?.val == q?.val }
    return p.val == q.val && isSameTree(p.left, q.left) && isSameTree(p.right, q.right)
  }
}
