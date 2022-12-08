//
//  TestHardLinkedListTasks.swift
//  TestAlgorithms
//
//  Created by Igor Ratynski on 08.12.2022.
//

import XCTest

class TestHardLinkedListTasks: HardTestCase { }

// MARK: 23. Merge k Sorted Lists
extension TestHardLinkedListTasks {
  func testMergeKSortedList() {
    let nodes = [[ListNode(1, ListNode(4, ListNode(5))), ListNode(1, ListNode(3, ListNode(4))), ListNode(2, ListNode(6))]]
    let outputs = [ListNode(1, ListNode(1, ListNode(2, ListNode(3, ListNode(4, ListNode(4, ListNode(5, ListNode(6))))))))]
    let set = Set([nodes.count, outputs.count])
    XCTAssertTrue(set.count == 1)
    
    for i in 0..<set.first! {
      XCTAssertEqual(solution.mergeKLists(nodes[i]), outputs[i])
    }
  }
}
