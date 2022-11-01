//
//  TestEasyLinkedListTasks.swift
//  TestAlgorithms
//
//  Created by Igor Ratynski on 09.10.2022.
//

import XCTest

class TestEasyLinkedListTasks: EasyTestCase { }

// MARK: 1290. Convert Binary Number in a Linked List to Integer
extension TestEasyLinkedListTasks {
  func testConvertBinaryNumberInLinkedListToInteger() {
    let inputs = [ListNode(0, ListNode(0, ListNode(1))), ListNode(1, ListNode(0, ListNode(0))), ListNode(1, ListNode(0, ListNode(0, ListNode(1))))]
    let outputs = [1,4,9]
    let set = Set([inputs.count, outputs.count])
    XCTAssertTrue(set.count == 1)

    for i in 0..<set.first! {
      XCTAssertEqual(solution.getDecimalValue(inputs[i]), outputs[i])
    }
  }
}
