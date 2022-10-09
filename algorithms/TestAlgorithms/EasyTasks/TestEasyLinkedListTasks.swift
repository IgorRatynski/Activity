//
//  TestEasyLinkedListTasks.swift
//  TestAlgorithms
//
//  Created by Igor Ratynski on 09.10.2022.
//

import XCTest


class TestEasyLinkedListTasks: EasyTestCase { }

// MARK: 938. Range Sum of BST
extension TestEasyLinkedListTasks {
  func testRangeSumBST() {
    let roots = [TreeNode(10, TreeNode(5, TreeNode(3), TreeNode(7)), TreeNode(15, nil, TreeNode(18))),
                 TreeNode(10, TreeNode(5, TreeNode(3, TreeNode(1), nil), TreeNode(7, TreeNode(6), nil)), TreeNode(15, TreeNode(13), TreeNode(18)))]
    let lows = [7, 6], highs = [15, 10]
    let outputs = [32, 23]
    let set = Set([roots.count, lows.count, highs.count, outputs.count])
    XCTAssertTrue(set.count == 1)
    
    for i in 0..<set.first! {
      XCTAssertEqual(solution.rangeSumBST(roots[i], lows[i], highs[i]), outputs[i])
    }
  }
}
