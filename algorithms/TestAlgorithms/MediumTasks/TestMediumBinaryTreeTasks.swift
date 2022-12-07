//
//  TestMediumBinaryTreeTasks.swift
//  TestAlgorithms
//
//  Created by Igor Ratynski on 07.12.2022.
//

import XCTest

class TestMediumBinaryTreeTasks: MediumTestCase { }

// MARK: 1315. Sum of Nodes with Even-Valued Grandparent
extension TestMediumBinaryTreeTasks {
  func testIntToRoman() {
    let inputs = [TreeNode(6, TreeNode(7, TreeNode(2, TreeNode(9)), TreeNode(7, TreeNode(1), TreeNode(4))), TreeNode(8, TreeNode(1, TreeNode(3, nil, TreeNode(5))))),
                  TreeNode(1)
    ]
    let outputs = [13, 0]
    let set = Set([inputs.count, outputs.count])
    XCTAssertTrue(set.count == 1)
    
    for i in 0..<set.first! {
      XCTAssertEqual(solution.sumEvenGrandparent(inputs[i]), outputs[i])
    }
  }
}
