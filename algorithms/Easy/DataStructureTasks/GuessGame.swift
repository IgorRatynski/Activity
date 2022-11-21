//
//  GuessGame.swift
//  Algorithms
//
//  Created by Igor Ratynski on 08.12.2022.
//

import Foundation

// MARK: 374. Guess Number Higher or Lower
protocol GuessGame {
  func guess(_ num: Int) -> Int
}

class GuessGameSolution : GuessGame {
  func guessNumber(_ n: Int) -> Int {
    var low = 1, high = n, mid = (1 + high) / 2, n = n
    
    while low < high {
      n = guess(mid)
      
      guard n != 0 else { return mid }
      if n == -1 {
        high = mid - 1
        mid = (low + high) / 2
      } else {
        low = mid + 1
        mid = (low + high) / 2
      }
    }
    
    return n
  }
  
  func guess(_ num: Int) -> Int {
    -1
  }
}
