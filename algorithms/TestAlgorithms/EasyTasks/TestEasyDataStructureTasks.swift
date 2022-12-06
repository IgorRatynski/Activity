//
//  TestEasyDataStructureTasks.swift
//  TestAlgorithms
//
//  Created by Igor Ratynski on 09.10.2022.
//

import XCTest

class TestEasyDataStructureTasks: EasyTestCase { }

// MARK: 933. Number of Recent Calls
extension TestEasyDataStructureTasks {
  func testRecentCounter() {
    let counter = Solution.Easy.RecentCounter()
    let inputs = [1, 100, 3001, 3002]
    let outputs = [1, 2, 3, 3]
    XCTAssertTrue(inputs.count == outputs.count)
    
    for i in 0..<inputs.count {
      XCTAssertEqual(counter.ping(inputs[i]), outputs[i])
    }
  }
}

// MARK: 1603. Design Parking System
extension TestEasyDataStructureTasks {
  func testDesignParkingSystem() {
    let parkingSystem = Solution.Easy.ParkingSystem(1, 1, 0)
    
    let inputs = [[1], [2], [3], [1]]
    let outputs = [true, true, false, false]
    XCTAssertTrue(Set([inputs.count, outputs.count]).count == 1)
    
    for i in 0..<inputs.count {
      XCTAssertEqual(parkingSystem.addCar(inputs[i].first!), outputs[i])
    }
  }
}

// MARK: 1656. Design an Ordered Stream
extension TestEasyDataStructureTasks {
  func testDesignOrderedStream() {
    let orderedStream = Solution.Easy.OrderedStream(5)
    
    let inputIds = [3,1,2,5,4]
    let inputValues = ["ccccc","aaaaa","bbbbb","eeeee","ddddd"]
    let outputs = [[], ["aaaaa"], ["bbbbb", "ccccc"], [], ["ddddd", "eeeee"]]
    XCTAssertTrue(Set([inputIds.count, inputValues.count, outputs.count]).count == 1)
    
    for i in 0..<inputIds.count {
      XCTAssertEqual(orderedStream.insert(inputIds[i], inputValues[i]), outputs[i])
    }
  }
}
