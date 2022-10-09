//
//  TestEasyIntTasks.swift
//  TestAlgorithms
//
//  Created by Igor Ratynski on 09.10.2022.
//


import XCTest

class TestEasyIntTasks: EasyTestCase { }

// MARK: 1281. Subtract the Product and Sum of Digits of an Integer
extension TestEasyIntArrayTasks {
  func testSubtractProductAndSum() {
    let inputs = [234, 4421, 55, 23, 1, 42143, 5777, 420]
    let outputs = [15, 21, 15, 1, 0, 82, 1689, -6]
    let set = Set([inputs.count, outputs.count])
    XCTAssertTrue(set.count == 1)
    
    for i in 0..<set.first! {
      XCTAssertEqual(solution.subtractProductAndSum(inputs[i]), outputs[i])
    }
  }
}

