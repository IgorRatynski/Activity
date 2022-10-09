//
//  TestEasyDataStructureTasks.swift
//  TestAlgorithms
//
//  Created by Igor Ratynski on 09.10.2022.
//

import XCTest

class TestEasyDataStructureTasks: EasyTestCase { }

// MARK: 933. Number of Recent Calls
extension TestEasyDataStructureTasks {
  func testRecentCounter() {
    let counter = Solution.Easy.RecentCounter()
    let inputs = [1, 100, 3001, 3002]
    let outputs = [1, 2, 3, 3]
    XCTAssertTrue(inputs.count == outputs.count)
    
    for i in 0..<inputs.count {
      XCTAssertEqual(counter.ping(inputs[i]), outputs[i])
    }
  }
}
