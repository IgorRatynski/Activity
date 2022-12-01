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
    var inputs = [420, 1994, 2999, 58]
    let outputs = ["CDXX", "MCMXCIV", "MMCMXCIX", "LVIII"]
    let set = Set([inputs.count, outputs.count])
    XCTAssertTrue(set.count == 1)
    
    for i in 0..<set.first! {
      XCTAssertEqual(solution.intToRoman(inputs[i]), outputs[i])
    }
  }
}
