//
//  MediumStringArrayTasks.swift
//  Algorithms
//
//  Created by Igor Ratynski on 03.11.2022.
//

import Foundation

// MARK: 2125. Number of Laser Beams in a Bank
extension Solution.Medium {
  func numberOfBeams(_ bank: [String]) -> Int {
    var result = 0, topLineCount: Int?, bottomLineCount: Int?
    
    for line in bank {
      guard let number = line.numberOfBeams else { continue }
      
      if topLineCount == nil {
        topLineCount = number
      } else if bottomLineCount == nil {
        bottomLineCount = number
      }
      
      if topLineCount != nil && bottomLineCount != nil {
        result += topLineCount! * bottomLineCount!
        topLineCount = bottomLineCount
        bottomLineCount = nil
      }
    }
    
    return result
  }
}

private extension String {
  var numberOfBeams: Int? {
    var result = 0, beam: Character = "1"
    
    for char in self {
      guard char == beam else { continue }
      result += 1
    }
    
    return result > 0 ? result : nil
  }
}
