//
//  TestEasyIntArrayTasks.swift
//  TestAlgorithms
//
//  Created by Igor Ratynski on 03.10.2022.
//

import XCTest

class TestEasyIntArrayTasks: EasyTestCase { }
  
// MARK: 1331. Rank Transform of an Array
extension TestEasyIntArrayTasks {
  func testArrayRankTransform() {
    let inputs = [[40,10,20,30], [100,100,100], [37,12,28,9,100,56,80,5,12], []]
    let outputs = [[4,1,2,3], [1,1,1], [5,3,4,2,8,6,7,1,3], []]
    XCTAssertTrue(inputs.count == outputs.count)
    
    for i in 0..<inputs.count {
      XCTAssertEqual(solution.arrayRankTransform(inputs[i]), outputs[i])
    }
  }
}

// MARK: 836. Rectangle Overlap
extension TestEasyIntArrayTasks {
  func testIsRectangleOverlap() {
    let inputs1 = [[0,0,2,2], [0,0,1,1], [0,0,1,1]], inputs2 = [[1,1,3,3], [1,0,2,1], [2,2,3,3]]
    let outputs = [true, false, false]
    XCTAssertTrue(Set([inputs1.count, inputs2.count, outputs.count]).count == 1)
    
    for i in 0..<inputs1.count {
      XCTAssertEqual(solution.isRectangleOverlap(inputs1[i], inputs2[i]), outputs[i])
    }
  }
}

// MARK: 1920. Build Array from Permutation
extension TestEasyIntArrayTasks {
  func testBuildArrayFromPermutation() {
    let inputs = [[0,2,1,5,3,4], [5,0,1,2,3,4]]
    let outputs = [[0,1,2,4,5,3], [4,5,0,1,2,3]]
    XCTAssertTrue(Set([inputs.count, outputs.count]).count == 1)
    
    for i in 0..<inputs.count {
      XCTAssertEqual(solution.buildArray(inputs[i]), outputs[i])
    }
  }
}
