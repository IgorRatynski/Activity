//
//  TestMediumIntArrayTasks.swift
//  TestAlgorithms
//
//  Created by Igor Ratynski on 14.11.2022.
//

import XCTest

class TestMediumIntArrayTasks: MediumTestCase { }

// MARK: 947. Most Stones Removed with Same Row or Column
extension TestMediumIntArrayTasks {
  func testMostStonesRemovedWithSameRowOrColumn() {
    let stones: [[[Int]]] = [
      [[0,1],[0,2],[4,3],[2,4],[0,3],[1,1]],
      [[0,1],[1,0],[1,1]],
      [[1,1],[1,0],[0,1]],
      [[0,0],[0,1],[1,0],[1,2],[2,1],[2,2]],
      [[0,0],[0,2],[1,1],[2,0],[2,2]],
      [[0,0]]
      ]
    let outputs = [4, 2, 2, 5, 3, 0]

    let set = Set([stones.count, outputs.count])
    XCTAssertTrue(set.count == 1)

//    for i in 0..<set.first! {
//      XCTAssertEqual(solution.removeStones(stones[i]), outputs[i])
//    }
  }
}
