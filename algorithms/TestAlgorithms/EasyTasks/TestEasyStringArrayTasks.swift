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

// MARK: 1773. Count Items Matching a Rule
extension TestEasyStringArrayTasks {
  func testCountItemsMatchingRule() {
    let inputs = [[["phone","blue","pixel"],["computer","silver","lenovo"],["phone","gold","iphone"]], [["phone","blue","pixel"],["computer","silver","phone"],["phone","gold","iphone"]]]
    let ruleKeys = ["color","type"]
    let ruleValues = ["silver","phone"]
    let outputs = [1,2]
    let set = Set([inputs.count, outputs.count])
    XCTAssertTrue(set.count == 1)
    
    for i in 0..<set.first! {
      XCTAssertEqual(solution.countMatches(inputs[i], ruleKeys[i], ruleValues[i]), outputs[i])
    }
  }
}

// MARK: 1662. Check If Two String Arrays are Equivalent
extension TestEasyStringArrayTasks {
  func testCheckIfTwoStringArraysEquivalent() {
    let inputs1 = [["abc", "d", "defg"], ["ab", "c"], ["a", "cb"], ["abc", "d", "defg"]]
    let inputs2 = [["abcddef"], ["a", "bc"], ["ab", "c"], ["abcddefg"]]
    let outputs = [false, true, false, true]
    let set = Set([inputs1.count, inputs2.count, outputs.count])
    XCTAssertTrue(set.count == 1)
    
    for i in 0..<set.first! {
      XCTAssertEqual(solution.arrayStringsAreEqual(inputs1[i], inputs2[i]), outputs[i])
    }
  }
}
