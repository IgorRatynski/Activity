//
//  TestMediumStringArrayTasks.swift
//  TestAlgorithms
//
//  Created by Igor Ratynski on 03.11.2022.
//

import XCTest

class TestMediumStringArrayTasks: MediumTestCase { }

// MARK: 2125. Number of Laser Beams in a Bank
extension TestMediumStringArrayTasks {
  func testNumberOfLaserBeamsInBank() {
    let inputs = [["011001","000000","010100","001000"],["000","111","000"]]
    let outputs = [8,0]
    let set = Set([inputs.count, outputs.count])
    XCTAssertTrue(set.count == 1)
    
    for i in 0..<set.first! {
      XCTAssertEqual(solution.numberOfBeams(inputs[i]), outputs[i])
    }
  }
}
