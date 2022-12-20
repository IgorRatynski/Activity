//
//  TestEasyBinaryTreeTasks.swift
//  TestAlgorithms
//
//  Created by Igor Ratynski on 07.12.2022.
//

import XCTest

class TestEasyBinaryTreeTasks: EasyTestCase { }

// MARK: 938. Range Sum of BST
extension TestEasyBinaryTreeTasks {
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

// MARK: 872. Leaf-Similar Trees
extension TestEasyBinaryTreeTasks {
  func testLeafSimilarTrees() {
    let rootsLeft =
    [TreeNode(3, TreeNode(5, TreeNode(6), TreeNode(2, TreeNode(7, TreeNode(4)))), TreeNode(1, TreeNode(9), TreeNode(8))),
     TreeNode(1, TreeNode(2), TreeNode(3))]
    let rootsRight =
    [TreeNode(3, TreeNode(5, TreeNode(6), TreeNode(7)), TreeNode(1, TreeNode(4), TreeNode(2, TreeNode(9), TreeNode(8)))),
     TreeNode(1, TreeNode(3), TreeNode(2))]
    let outputs = [false, false]
    let set = Set([rootsLeft.count, rootsRight.count, outputs.count])
    XCTAssertTrue(set.count == 1)
    
    for i in 0..<set.first! {
      XCTAssertEqual(solution.leafSimilar(rootsLeft[i], rootsRight[i]), outputs[i])
    }
  }
}

// MARK: 100. Same Tree
extension TestEasyBinaryTreeTasks {
  func testSameTree() {
    let rootsLeft = [TreeNode(1, TreeNode(2), TreeNode(1))]
    let rootsRight = [TreeNode(1, TreeNode(1), TreeNode(2))]
    let outputs = [false]
    let set = Set([rootsLeft.count, rootsRight.count, outputs.count])
    XCTAssertTrue(set.count == 1)
    
    for i in 0..<set.first! {
      XCTAssertEqual(solution.isSameTree(rootsLeft[i], rootsRight[i]), outputs[i])
    }
  }
}
