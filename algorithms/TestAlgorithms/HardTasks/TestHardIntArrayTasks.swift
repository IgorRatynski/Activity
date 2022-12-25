//
//  TestHardIntArrayTasks.swift
//  TestAlgorithms
//
//  Created by Igor Ratynski on 25.12.2022.
//

import XCTest

class TestHardIntArrayTasks: HardTestCase { }

// MARK: 239. Sliding Window Maximum
extension TestHardIntArrayTasks {
  func testSlidingWindowMaximum() {
    let arrays = [[1,3,-1,-3,5,3,6,7], [1]]
    let ks = [3, 1]
    let outputs = [[3,3,5,5,6,7], [1]]

    let set = Set([arrays.count, ks.count, outputs.count])
    XCTAssertTrue(set.count == 1)

    for i in 0..<set.first! {
      XCTAssertEqual(solution.maxSlidingWindow(arrays[i], ks[i]), outputs[i])
    }
  }
}
