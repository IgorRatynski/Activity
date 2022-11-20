//
//  EasyString.swift
//  TestAlgorithms
//
//  Created by Igor Ratynski on 30.08.2022.
//

import XCTest

class TestEasyStringTasks: EasyTestCase { }

// MARK: 14. Longest Common Prefix
extension TestEasyStringTasks {
  func testLongestCommonPrefix() {
    let inputs = [["flower", "flow", "flight"], ["dog", "racecar", "car"]]
    let outputs = ["fl", ""]
    XCTAssertTrue(inputs.count == outputs.count)
    
    for i in 0..<inputs.count {
      XCTAssertEqual(solution.longestCommonPrefix(inputs[i]), outputs[i])
    }
  }
}

// MARK: 771. Jewels and Stones
extension TestEasyStringTasks {
  func testNumJewelsInStones() {
    let inputs = ["aA", "oO", "ds"], arguments = ["aAAAbbbb", "fsoFFpsekfpkpSKFPOK", "II"]
    let outputs = [4, 2, 0]
    XCTAssertTrue(inputs.count == arguments.count)
    XCTAssertTrue(arguments.count == outputs.count)
    
    for i in 0..<inputs.count {
      XCTAssertEqual(solution.numJewelsInStones(inputs[i], arguments[i]), outputs[i])
    }
  }
}

// MARK: 859. Buddy Strings
extension TestEasyStringTasks {
  func testBuddyStrings() {
    let inputs = ["jasoidjfo", "asdfghjkl", "jasoidjfo"], goals = ["oasoidjfj", "asdfghjkl", "jasoidjfo"]
    let outputs = [true, false, true]
    XCTAssertTrue(inputs.count == goals.count)
    XCTAssertTrue(goals.count == outputs.count)
    
    for i in 0..<inputs.count {
      XCTAssertEqual(solution.buddyStrings(inputs[i], goals[i]), outputs[i])
    }
  }
}

// MARK: 917. Reverse Only Letters
extension TestEasyStringTasks {
  func testReverseOnlyLetters() {
    let inputs = ["ab-cd", "a-bC-dEf-ghIj", "Test1ng-Leet=code-Q!", "_fa_", "-f-", "-fae-", "ab", "a", "-", "--", "---", "aaa", "7_28]"]
    let outputs = ["dc-ba", "j-Ih-gfE-dCba", "Qedo1ct-eeLg=ntse-T!", "_af_", "-f-", "-eaf-", "ba", "a", "-", "--", "---", "aaa", "7_28]"]
    XCTAssertTrue(inputs.count == outputs.count)
    
    for i in 0..<inputs.count {
      XCTAssertEqual(solution.reverseOnlyLetters(inputs[i]), outputs[i])
    }
  }
}

// MARK: 925. Long Pressed Name
extension TestEasyStringTasks {
  func testIsLongPressedName() {
    let name = ["alex", "alex", "a", "alex", "saeed"]
    let typed = ["aaleexeex", "aaleexa", "e", "aaleex", "ssaaedd"]
    let outputs = [false, false, false, true, false]
    XCTAssertTrue(Set([name.count, typed.count, outputs.count]).count == 1)
    
    for i in 0..<name.count {
      XCTAssertEqual(solution.isLongPressedName(name[i], typed[i]), outputs[i])
    }
  }
}

// MARK: 1876. Substrings of Size Three with Distinct Characters
extension TestEasyStringTasks {
  func testCountGoodSubstrings() {
    let inputs = ["jnndjbnlanbbashbbiuwefiuhwiufh", "xyzzaz", "aababcabc", "sdafmgiojaiofjkei", "d", "sf", "saf"]
    let outputs = [22, 1, 4, 15, 0, 0, 1]
    let set = Set([inputs.count, outputs.count])
    XCTAssertTrue(set.count == 1)
    
    for i in 0..<set.first! {
      XCTAssertEqual(solution.countGoodSubstrings(inputs[i]), outputs[i])
    }
  }
}

// MARK: 1221. Split a String in Balanced Strings
extension TestEasyStringTasks {
  func testBalancedStringSplit() {
    let inputs = ["RLRRLLRLRL", "RLRRRLLRLL", "LLLLRRRR", "RLRLRLRLRLRLRRLLRLRLRLRLLRRL", "RL"]
    let outputs = [4, 2, 1, 13, 1]
    let set = Set([inputs.count, outputs.count])
    XCTAssertTrue(set.count == 1)
    
    for i in 0..<set.first! {
      XCTAssertEqual(solution.balancedStringSplit(inputs[i]), outputs[i])
    }
  }
}

// MARK: 1154. Day of the Year
extension TestEasyStringTasks {
  func testDayOfTheYear() {
    let inputs = ["1900-04-20", "1904-04-20", "2019-01-09", "2019-02-10", "2019-12-10"]
    let outputs = [110, 111, 9, 41, 344]
    let set = Set([inputs.count, outputs.count])
    XCTAssertTrue(set.count == 1)
    
    for i in 0..<set.first! {
      XCTAssertEqual(solution.dayOfYear(inputs[i]), outputs[i])
    }
  }
}

// MARK: 1790. Check if One String Swap Can Make Strings Equal
extension TestEasyStringTasks {
  func testCheckIfPangram() {
    let inputs = ["thequickbrownfoxjumpsoverthelazydog", "leetcode", "s", "akoekfpokvmdkmzcxmvbbnmlsdlakdsofrlekoasolfoaoqeqwertyuioph"]
    let outputs = [true, false, false, false]
    let set = Set([inputs.count, outputs.count])
    XCTAssertTrue(set.count == 1)
    
    for i in 0..<set.first! {
      XCTAssertEqual(solution.checkIfPangram(inputs[i]), outputs[i])
    }
  }
}

// MARK: 1678. Goal Parser Interpretation
extension TestEasyStringTasks {
  func testGoalParserInterpretation() {
    let inputs = ["G()(al)", "G()()()()(al)", "(al)G(al)()()G", "G", "()", "(al)"]
    let outputs = ["Goal", "Gooooal", "alGalooG", "G", "o", "al"]
    let set = Set([inputs.count, outputs.count])
    XCTAssertTrue(set.count == 1)
    
    for i in 0..<set.first! {
      XCTAssertEqual(solution.interpret(inputs[i]), outputs[i])
    }
  }
}

// MARK: 1704. Determine if String Halves Are Alike
extension TestEasyStringTasks {
  func testStringHalvesAreAlike() {
    let inputs = ["book", "textbook", "notebook"]
    let outputs = [true, false, true]
    let set = Set([inputs.count, outputs.count])
    XCTAssertTrue(set.count == 1)
    
    for i in 0..<set.first! {
      XCTAssertEqual(solution.halvesAreAlike(inputs[i]), outputs[i])
    }
  }
}

// MARK: 1689. Partitioning Into Minimum Number Of Deci-Binary Numbers
extension TestEasyStringTasks {
  func testPartitioningIntoMinimumNumberOfDeciBinaryNumbers() {
    let inputs = ["32", "82734", "27346209830709182346", "1010101010101"]
    let outputs = [3, 8, 9, 1]
    let set = Set([inputs.count, outputs.count])
    XCTAssertTrue(set.count == 1)
    
    for i in 0..<set.first! {
      XCTAssertEqual(solution.minPartitions(inputs[i]), outputs[i])
    }
  }
}

// MARK: 1108. Defanging an IP Address
extension TestEasyStringTasks {
  func testDefangingAnIpAddress() {
    let inputs = ["1.1.1.1", "255.100.50.0"]
    let outputs = ["1[.]1[.]1[.]1", "255[.]100[.]50[.]0"]
    let set = Set([inputs.count, outputs.count])
    XCTAssertTrue(set.count == 1)
    
    for i in 0..<set.first! {
      XCTAssertEqual(solution.defangIPaddr(inputs[i]), outputs[i])
    }
  }
}

// MARK: 2194. Cells in a Range on an Excel Sheet
extension TestEasyStringTasks {
  func testCellsRangeExcelSheet() {
    let inputs = ["K1:L2", "A1:F1", "Y1:Z2", "Z1:Z1", "U7:X9"]
    let outputs = [["K1","K2","L1","L2"], ["A1","B1","C1","D1","E1","F1"], ["Y1","Y2","Z1","Z2"], ["Z1"], ["U7","U8","U9","V7","V8","V9","W7","W8","W9","X7","X8","X9"]]
    let set = Set([inputs.count, outputs.count])
    XCTAssertTrue(set.count == 1)
    
    for i in 0..<set.first! {
      XCTAssertEqual(solution.cellsInRange(inputs[i]), outputs[i])
    }
  }
}
