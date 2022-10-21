//
//  TestMediumIntTasks.swift
//  TestAlgorithms
//
//  Created by Igor Ratynski on 02.12.2022.
//

import XCTest

class TestMediumIntTasks: MediumTestCase { }

// MARK: 12. Integer to Roman
extension TestMediumIntTasks {
  func testIntToRoman() {
    let inputs = [420, 1994, 2999, 58]
    let outputs = ["CDXX", "MCMXCIV", "MMCMXCIX", "LVIII"]
    let set = Set([inputs.count, outputs.count])
    XCTAssertTrue(set.count == 1)
    
    for i in 0..<set.first! {
      XCTAssertEqual(solution.intToRoman(inputs[i]), outputs[i])
    }
  }
}

// MARK: 2396. Strictly Palindromic Number
extension TestMediumIntTasks {
  func testStrictlyPalindromicNumber() {
    let inputs = [4, 9, 420, 99999, 100000]
    let outputs = [false, false, false, false, false]
    let set = Set([inputs.count, outputs.count])
    XCTAssertTrue(set.count == 1)
    
    for i in 0..<set.first! {
      XCTAssertEqual(solution.isStrictlyPalindromic(inputs[i]), outputs[i])
    }
    
    for i in 4...100000 {
      XCTAssertFalse(solution.isStrictlyPalindromic(i))
    }
  }
}
