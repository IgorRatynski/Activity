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

// MARK: 11. Container With Most Water
extension TestMediumIntArrayTasks {
  func testContainerWithMostWater() {
    let arrays = [[1,8,6,2,5,4,8,3,7], [1,1]]
    let outputs = [49,1]

    let set = Set([arrays.count, outputs.count])
    XCTAssertTrue(set.count == 1)

    for i in 0..<set.first! {
      XCTAssertEqual(solution.maxArea(arrays[i]), outputs[i])
    }
  }
}

// MARK: 54. Spiral Matrix
extension TestMediumIntArrayTasks {
  func testSpiralMatrix() {
    let arrays = [[[1,2,3],[4,5,6],[7,8,9]], [[1,2,3,4],[5,6,7,8],[9,10,11,12]], [[1,2,3,4],[5,6,7,8],[9,10,11,12],[13,14,15,16]], [[1,2,3,4,5],[6,7,8,9,10],[11,12,13,14,15],[16,17,18,19,20]]]
    let outputs = [[1,2,3,6,9,8,7,4,5], [1,2,3,4,8,12,11,10,9,5,6,7], [1,2,3,4,8,12,16,15,14,13,9,5,6,7,11,10], [1,2,3,4,5,10,15,20,19,18,17,16,11,6,7,8,9,14,13,12]]

    let set = Set([arrays.count, outputs.count])
    XCTAssertTrue(set.count == 1)

    for i in 0..<set.first! {
      XCTAssertEqual(solution.spiralOrder(arrays[i]), outputs[i])
    }
  }
}

// MARK: 347. Top K Frequent Elements
extension TestMediumIntArrayTasks {
  func testTopKFrequentElements() {
    let arrays = [[1,1,1,2,2,3], [1]]
    let ks = [2, 1]
    let outputs = [[1,2], [1]]

    let set = Set([arrays.count, ks.count, outputs.count])
    XCTAssertTrue(set.count == 1)

    for i in 0..<set.first! {
      XCTAssertEqual(solution.topKFrequent(arrays[i], ks[i]), outputs[i])
    }
  }
}
