//
//  MediumCharaterArrayTasks.swift
//  Medium
//
//  Created by Igor Ratynski on 24.10.2022.
//

import Foundation

// MARK: 200. Number of Islands
extension Solution.Medium {
  func numIslands(_ grid: [[Character]]) -> Int {
    guard !grid.isEmpty, !grid.first!.isEmpty else { return 0 }
    var result = 0, grid = grid
    
    func process(i: Int, j: Int) {
      guard i >= 0, j >= 0, i < grid.count, j < grid[0].count, grid[i][j] == "1" else { return }
      grid[i][j] = "0"
      process(i: i - 1, j: j)
      process(i: i + 1, j: j)
      process(i: i, j: j - 1)
      process(i: i, j: j + 1)
    }
    
    for i in 0..<grid.count {
      for j in 0..<grid[i].count {
        guard grid[i][j] == "1" else { continue }
        process(i: i, j: j)
        result += 1
      }
    }
    
    return result
  }
}
