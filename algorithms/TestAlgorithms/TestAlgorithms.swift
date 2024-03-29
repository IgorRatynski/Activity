//
//  TestAlgorithms.swift
//  TestAlgorithms
//
//  Created by Igor Ratynski on 18.08.2022.
//

import XCTest
@testable import Algorithms

class TestAlgorithms: XCTestCase {
  
  override func setUpWithError() throws {
    // Put setup code here. This method is called before the invocation of each test method in the class.
  }
  
  override func tearDownWithError() throws {
    // Put teardown code here. This method is called after the invocation of each test method in the class.
  }
  
  func testExample() throws {
    // This is an example of a functional test case.
    // Use XCTAssert and related functions to verify your tests produce the correct results.
  }
  
  func testPerformanceI() throws {
    let metrics: [XCTMetric] = [XCTMemoryMetric(), XCTStorageMetric(), XCTClockMetric()]
    
    let measureOptions = XCTMeasureOptions.default
    measureOptions.iterationCount = 1
    
//      let nums = [1,2,3,4,5,4,4,5,4,4,3,5,5,3,4,5,54,5,4,543,3,5,3,4,5,4]
    let n = 45
    let solution = Solution.Medium()
    
    measure(metrics: metrics, options: measureOptions) {
//      solution.climbStairsI(n) // passed (0.036 seconds). // 4.636
      solution.testMN() //  5.107
    }
  }
  
}
