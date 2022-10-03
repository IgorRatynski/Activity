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
