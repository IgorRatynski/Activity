//
//  EasyString.swift
//  TestAlgorithms
//
//  Created by Igor Ratynski on 30.08.2022.
//

import XCTest

class TestEasyStringTasks: EasyTestCase { }

// MARK: 14. Longest Common Prefix
extension TestEasyStringTasks {
  func testLongestCommonPrefix() {
    let inputs = [["flower", "flow", "flight"], ["dog", "racecar", "car"]]
    let outputs = ["fl", ""]
    XCTAssertTrue(inputs.count == outputs.count)
    
    for i in 0..<inputs.count {
      XCTAssertEqual(solution.longestCommonPrefix(inputs[i]), outputs[i])
    }
  }
}

// MARK: 771. Jewels and Stones
extension TestEasyStringTasks {
  func testNumJewelsInStones() {
    let inputs = ["aA", "oO", "ds"], arguments = ["aAAAbbbb", "fsoFFpsekfpkpSKFPOK", "II"]
    let outputs = [4, 2, 0]
    XCTAssertTrue(inputs.count == arguments.count)
    XCTAssertTrue(arguments.count == outputs.count)
    
    for i in 0..<inputs.count {
      XCTAssertEqual(solution.numJewelsInStones(inputs[i], arguments[i]), outputs[i])
    }
  }
}

// MARK: 859. Buddy Strings
extension TestEasyStringTasks {
  func testBuddyStrings() {
    let inputs = ["jasoidjfo", "asdfghjkl", "jasoidjfo"], goals = ["oasoidjfj", "asdfghjkl", "jasoidjfo"]
    let outputs = [true, false, true]
    XCTAssertTrue(inputs.count == goals.count)
    XCTAssertTrue(goals.count == outputs.count)
    
    for i in 0..<inputs.count {
      XCTAssertEqual(solution.buddyStrings(inputs[i], goals[i]), outputs[i])
    }
  }
}
