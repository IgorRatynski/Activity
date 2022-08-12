//
//  EasyBinaryTreeTasks.swift
//  Easy
//
//  Created by Igor Ratynski on 12.08.2022.
//

import Foundation

extension Solution.Easy {
  func checkTree(_ root: TreeNode?) -> Bool {
    root?.val ?? 0 == (root?.left?.val ?? 0) + (root?.right?.val ?? 0)
  }
}
