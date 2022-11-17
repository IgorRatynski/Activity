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

// MARK: 74. Search a 2D Matrix
extension TestMediumIntArrayTasks {
  func testSearchA2DMatrix() {
    let matrices = [
      [[1,3,5,7],[10,11,16,20],[23,30,34,60]], [[1,3,5,7],[10,11,16,20],[23,30,34,60]], [[1,3]], [[1]]
    ]
    let targets = [3,13,3,0]
    let outputs = [true, false, true, false]

    let set = Set([matrices.count, targets.count, outputs.count])
    XCTAssertTrue(set.count == 1)

    for i in 0..<set.first! {
      XCTAssertEqual(solution.searchMatrix(matrices[i], targets[i]), outputs[i])
    }
  }
}

// MARK: 33. Search in Rotated Sorted Array
extension TestMediumIntArrayTasks {
  func testSearchInRotatedSortedArray() {
    let arrays = [[4,5,6,7,0,1,2], [4,5,6,7,0,1,2], [1], [1,3]]
    let targets = [0,3,0,1]
    let outputs = [4,-1,-1,0]

    let set = Set([arrays.count, targets.count, outputs.count])
    XCTAssertTrue(set.count == 1)

    for i in 0..<set.first! {
      XCTAssertEqual(solution.search(arrays[i], targets[i]), outputs[i])
    }
  }
}
