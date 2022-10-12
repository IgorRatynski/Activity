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

// MARK: 2427. Number of Common Factors
extension TestEasyIntArrayTasks {
  func testCommonFactors() {
    let inputs1 = [12, 25, 10, 11, 144, 1, 344, 999]
    let inputs2 = [6, 30, 15, 17, 12, 1, 451, 999]
    let outputs = [4, 2, 2, 1, 6, 1, 1, 8]
    let set = Set([inputs1.count, inputs2.count, outputs.count])
    XCTAssertTrue(set.count == 1)
    
    for i in 0..<set.first! {
      XCTAssertEqual(solution.commonFactors(inputs1[i], inputs2[i]), outputs[i])
    }
  }
}

// MARK: 1089. Duplicate Zeros
extension TestEasyIntArrayTasks {
  func testDuplicateZeros() {
    var inputs = [[1,0,2,3,0,4,5,0], [0,0], [0,1], [1,1], [4,2,0]]
    let outputs = [[1,0,0,2,3,0,0,4], [0,0], [0,0], [1,1], [4,2,0]]
    let set = Set([inputs.count, outputs.count])
    XCTAssertTrue(set.count == 1)
    
    for i in 0..<set.first! {
      solution.duplicateZeros(&inputs[i])
      XCTAssertEqual(inputs[i], outputs[i])
    }
  }
}
