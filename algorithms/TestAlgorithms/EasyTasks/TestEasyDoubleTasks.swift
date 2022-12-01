//
//  TestEasyDoubleTasks.swift
//  TestAlgorithms
//
//  Created by Igor Ratynski on 01.12.2022.
//

import XCTest

class TestEasyDoubleTasks: EasyTestCase { }

// MARK: 2469. Convert the Temperature
extension TestEasyIntArrayTasks {
  func testConvertTheTemperature() {
    let inputs = [36.50, 122.11, 0, 1000]
    let outputs = [[309.65000,97.70000], [395.26000,251.79800], [273.15000,32.00000], [1273.15000,1832.00000]]
    let set = Set([inputs.count, outputs.count])
    XCTAssertTrue(set.count == 1)
    
    for i in 0..<set.first! {
      XCTAssertEqual(solution.convertTemperature(inputs[i]), outputs[i])
    }
  }
}
