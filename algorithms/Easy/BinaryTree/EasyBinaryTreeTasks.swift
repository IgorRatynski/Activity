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

// MARK: 101. Symmetric Tree
extension Solution.Easy {
  func isSymmetric(_ root: TreeNode?) -> Bool {
    isEqual(root?.left, to: root?.right)
  }
  
  private func isEqual(_ left: TreeNode?, to right: TreeNode?) -> Bool {
    guard let left = left, let right = right else { return left?.val == right?.val }
    return left.val == right.val && isEqual(left.left, to: right.right) && isEqual(left.right, to: right.left)
  }
}

// MARK: 144. Binary Tree Preorder Traversal
extension Solution.Easy {
  func preorderTraversal(_ root: TreeNode?) -> [Int] {
    var result: [Int] = []
    prewrite(root: root, to: &result)
    return result
  }
  
  private func prewrite(root: TreeNode?, to array: inout [Int]) {
    guard root != nil else { return }
    array.append(root!.val)
    prewrite(root: root?.left, to: &array)
    prewrite(root: root?.right, to: &array)
  }
}

  }
}
