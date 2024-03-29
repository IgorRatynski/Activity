//
//  TestMediumStringsTasks.swift
//  TestAlgorithms
//
//  Created by Igor Ratynski on 20.10.2022.
//

import XCTest

class TestMediumStringsTasks: MediumTestCase { }

// MARK: 692. Top K Frequent Words
extension TestMediumStringsTasks {
  func testTopKFrequentWords() {
    let words = [["i","love","leetcode","i","love","coding"],
                 ["the","day","is","sunny","the","the","the","sunny","is","is"],
                 ["i","i","b"]]
    let ks = [2,4,2]
    let outputs = [["i","love"], ["the","is","sunny","day"], ["i","b"]]

    let set = Set([words.count, ks.count, outputs.count])
    XCTAssertTrue(set.count == 1)
    
    for i in 0..<set.first! {
      XCTAssertEqual(solution.topKFrequent(words[i], ks[i]), outputs[i])
    }
  }
}

// MARK: 151. Reverse Words in a String
extension TestMediumStringsTasks {
  func testReverseWords() {
    let inputs = ["the sky is blue", "  hello world  ", "a good   example"]
    let outputs = ["blue is sky the", "world hello", "example good a"]
    let set = Set([inputs.count, outputs.count])
    XCTAssertTrue(set.count == 1)
    
    for i in 0..<set.first! {
      XCTAssertEqual(solution.reverseWords(inputs[i]), outputs[i])
    }
  }
}
