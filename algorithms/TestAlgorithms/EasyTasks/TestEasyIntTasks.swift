//
//  TestEasyIntTasks.swift
//  TestAlgorithms
//
//  Created by Igor Ratynski on 09.10.2022.
//


import XCTest

class TestEasyIntTasks: EasyTestCase { }

// MARK: 507. Perfect Number
extension TestEasyIntArrayTasks {
  func testPerfectNumber() {
    let inputs = [28, 1, 2, 3, 4, 5, 6, 7, 1000000, 9999999, 9999998, 9999997]
    let outputs = [true, false, false, false, false, false, true, false, false, false, false, false]
    let set = Set([inputs.count, outputs.count])
    XCTAssertTrue(set.count == 1)
    
    for i in 0..<set.first! {
      XCTAssertEqual(solution.checkPerfectNumber(inputs[i]), outputs[i])
    }
  }
}

// MARK: 258. Add Digits
extension TestEasyIntArrayTasks {
  func testAddDigits() {
    let inputs = [38, 11, 4, 53252, 420]
    let outputs = [2, 2, 4, 8, 6]
    let set = Set([inputs.count, outputs.count])
    XCTAssertTrue(set.count == 1)
    
    for i in 0..<set.first! {
      XCTAssertEqual(solution.addDigits(inputs[i]), outputs[i])
    }
  }
}

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

