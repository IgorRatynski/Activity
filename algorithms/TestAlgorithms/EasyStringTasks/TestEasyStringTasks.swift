//
//  EasyString.swift
//  TestAlgorithms
//
//  Created by Igor Ratynski on 30.08.2022.
//

import XCTest

class TestEasyStringTasks: XCTestCase {
  
  // MARK: Properties
  private var solution = Solution.Easy()
  
}

// MARK: test longest common prefix
extension TestEasyStringTasks {
  func testLongestCommonPrefix() throws {
    var strs = ["flower","flow","flight"]
    XCTAssertEqual(solution.longestCommonPrefix(strs), "fl")
    strs = ["dog","racecar","car"]
    XCTAssertEqual(solution.longestCommonPrefix(strs), "")
  }
}
