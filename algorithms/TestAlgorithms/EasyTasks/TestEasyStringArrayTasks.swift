//
//  TestEasyStringArrayTasks.swift
//  TestAlgorithms
//
//  Created by Igor Ratynski on 21.10.2022.
//

import XCTest

class TestEasyStringArrayTasks: EasyTestCase { }

// MARK: 599. Minimum Index Sum of Two Lists
extension TestEasyStringArrayTasks {
  //  func testLongestCommonPrefix() {
  //    let list1 = [["Shogun","Tapioca Express","Burger King","KFC"], ["Shogun","Tapioca Express","Burger King","KFC"], ["happy","sad","good"]]
  //    let list2 = [["Piatti","The Grill at Torrey Pines","Hungry Hunter Steakhouse","Shogun"], ["KFC","Shogun","Burger King"], ["sad","happy","good"]]
  //    let outputs = [["Shogun"], ["Shogun"], ["sad","happy"]]
  //    let set = Set([list1.count, list2.count, outputs.count])
  //    XCTAssertTrue(set.count == 1)
  //
  //    for i in 0..<set.first! {
  //      XCTAssertEqual(solution.findRestaurant(list1, list2), outputs[i])
  //    }
  //  }
}

// MARK: 2011. Final Value of Variable After Performing Operations
extension TestEasyStringArrayTasks {
  func testFinalValueOfVariableAfterPerformingOperations() {
    let inputs = [["--X","X++","X++","X++","X++", "++X"], ["X++", "--X","X++","X++","++X", "X--"], ["X++","++X","--X","X--"]]
    let outputs = [4, 2, 0]
    let set = Set([inputs.count, outputs.count])
    XCTAssertTrue(set.count == 1)
    
    for i in 0..<set.first! {
      XCTAssertEqual(solution.finalValueAfterOperations(inputs[i]), outputs[i])
    }
  }
}
