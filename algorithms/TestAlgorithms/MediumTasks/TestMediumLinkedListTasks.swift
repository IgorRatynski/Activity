//
//  TestMediumLinkedListTasks.swift
//  TestAlgorithms
//
//  Created by Igor Ratynski on 05.12.2022.
//

import XCTest

class TestMediumLinkedListTasks: MediumTestCase { }

// MARK: 2181. Merge Nodes in Between Zeros
extension TestMediumLinkedListTasks {
  func testMostStonesRemovedWithSameRowOrColumn() {
    let nodes = [
      ListNode(0, ListNode(3, ListNode(1, ListNode(0, ListNode(4, ListNode(5, ListNode(2, ListNode(0)))))))),
      ListNode(0, ListNode(1, ListNode(0, ListNode(3, ListNode(0, ListNode(2, ListNode(2, ListNode(0))))))))
      ]
    let outputs = [ListNode(4, ListNode(11)),
                   ListNode(1, ListNode(3, ListNode(4)))]

    let set = Set([nodes.count, outputs.count])
    XCTAssertTrue(set.count == 1)

    for i in 0..<set.first! {
      XCTAssertEqual(solution.mergeNodes(nodes[i]), outputs[i])
    }
  }
}
