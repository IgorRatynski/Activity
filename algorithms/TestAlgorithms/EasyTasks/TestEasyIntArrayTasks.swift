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

// MARK: 1929. Concatenation of Array
extension TestEasyIntArrayTasks {
  func testConcatenationOfArray() {
    let inputs = [[1,2,1], [1,3,2,1]]
    let outputs = [[1,2,1,1,2,1], [1,3,2,1,1,3,2,1]]
    XCTAssertTrue(Set([inputs.count, outputs.count]).count == 1)
    
    for i in 0..<inputs.count {
      XCTAssertEqual(solution.getConcatenation(inputs[i]), outputs[i])
    }
  }
}

// MARK: 1480. Running Sum of 1d Array
extension TestEasyIntArrayTasks {
  func testRunningSumOf1dArray() {
    let inputs = [[1,2,3,4], [1,1,1,1,1], [3,1,2,10,1], [420]]
    let outputs = [[1,3,6,10], [1,2,3,4,5], [3,4,6,16,17], [420]]
    XCTAssertTrue(Set([inputs.count, outputs.count]).count == 1)
    
    for i in 0..<inputs.count {
      XCTAssertEqual(solution.runningSum(inputs[i]), outputs[i])
    }
  }
}

// MARK: 1470. Shuffle the Array
extension TestEasyIntArrayTasks {
  func testShuffleTheArray() {
    let inputs = [[2,5,1,3,4,7], [1,2,3,4,4,3,2,1], [1,1,2,2]]
    let nums = [3, 4, 2]
    let outputs = [[2,3,5,4,1,7], [1,4,2,3,3,2,4,1], [1,2,1,2]]
    XCTAssertTrue(Set([inputs.count, nums.count, outputs.count]).count == 1)
    
    for i in 0..<inputs.count {
      XCTAssertEqual(solution.shuffle(inputs[i], nums[i]), outputs[i])
    }
  }
}

// MARK: 1431. Kids With the Greatest Number of Candies
extension TestEasyIntArrayTasks {
  func testKidsWithGreatestCandiesNumber() {
    let inputs = [[2,3,5,1,3], [4,2,1,1,2], [12,1,12], [1,2,3,4]]
    let extraCandies = [3, 1, 10, 1]
    let outputs = [[true,true,true,false,true], [true,false,false,false,false], [true,false,true], [false,false,true,true]]
    XCTAssertTrue(Set([inputs.count, extraCandies.count, outputs.count]).count == 1)
    
    for i in 0..<inputs.count {
      XCTAssertEqual(solution.kidsWithCandies(inputs[i], extraCandies[i]), outputs[i])
    }
  }
}

// MARK: 1365. How Many Numbers Are Smaller Than the Current Number
extension TestEasyIntArrayTasks {
  func testHowManyNumbersAreSmallerThanCurrentNumber() {
    let inputs = [[8,1,2,2,3], [6,5,4,8], [7,7,7,7]]
    let outputs = [[4,0,1,1,3], [2,1,0,3], [0,0,0,0]]
    XCTAssertTrue(Set([inputs.count, outputs.count]).count == 1)
    
    for i in 0..<inputs.count {
      XCTAssertEqual(solution.smallerNumbersThanCurrent(inputs[i]), outputs[i])
    }
  }
}

// MARK: 1389. Create Target Array in the Given Order
extension TestEasyIntArrayTasks {
  func testCreateTargetArrayInGivenOrder() {
    let inputsNums = [[0,1,2,3,4], [1,2,3,4,0], [1]]
    let inputsIndexies = [[0,1,2,2,1], [0,1,2,3,0], [0]]
    let outputs = [[0,4,1,3,2], [0,1,2,3,4], [1]]
    XCTAssertTrue(Set([inputsNums.count, inputsIndexies.count, outputs.count]).count == 1)
    
    for i in 0..<inputsNums.count {
      XCTAssertEqual(solution.createTargetArray(inputsNums[i], inputsIndexies[i]), outputs[i])
    }
  }
}

// MARK: 1313. Decompress Run-Length Encoded List
extension TestEasyIntArrayTasks {
  func testDecompressRunLengthEncodedList() {
    let inputs = [[1,2,3,4], [1,1,2,3]]
    let outputs = [[2,4,4,4], [1,3,3]]
    XCTAssertTrue(Set([inputs.count, outputs.count]).count == 1)
    
    for i in 0..<inputs.count {
      XCTAssertEqual(solution.decompressRLElist(inputs[i]), outputs[i])
    }
  }
}

// MARK: 2006. Count Number of Pairs With Absolute Difference K
extension TestEasyIntArrayTasks {
  func testCountNumberOfPairsWithAbsoluteDifferenceK() {
    let inputs = [[1,2,2,1],[1,3],[3,2,1,5,4]]
    let ks = [1,3,2]
    let outputs = [4,0,3]
    XCTAssertTrue(Set([inputs.count, outputs.count]).count == 1)
    
    for i in 0..<inputs.count {
      XCTAssertEqual(solution.countKDifference(inputs[i], ks[i]), outputs[i])
    }
  }
}

// MARK: 704. Binary Search
extension TestEasyIntArrayTasks {
  func testBinarySearch() {
    let inputs = [[-1,0,3,5,9,12],[-1,0,3,5,9,12]]
    let targets = [9,2]
    let outputs = [4,-1]
    XCTAssertTrue(Set([inputs.count, outputs.count]).count == 1)
    
    for i in 0..<inputs.count {
      XCTAssertEqual(solution.search(inputs[i], targets[i]), outputs[i])
    }
  }
}

// MARK: 136. Single Number
extension TestEasyIntArrayTasks {
  func testSingleNumber() {
    let inputs = [[2,2,1],[4,1,2,1,2],[1]]
    let outputs = [1,4,1]
    XCTAssertTrue(Set([inputs.count, outputs.count]).count == 1)
    
    for i in 0..<inputs.count {
      XCTAssertEqual(solution.singleNumber(inputs[i]), outputs[i])
    }
  }
}

