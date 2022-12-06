//
//  OrderedStream.swift
//  Algorithms
//
//  Created by Igor Ratynski on 06.12.2022.
//

import Foundation

// MARK: 1656. Design an Ordered Stream
extension Solution.Easy {
  
  class OrderedStream {
    
    // MARK: Properties
    private var buffer: [String?]
    private var fillPointer = 0
    
    // MARK: Lifecycle
    init(_ n: Int) {
      buffer = Array(repeating: nil, count: n + 1)
    }
    
    // MARK: Public functions
    func insert(_ idKey: Int, _ value: String) -> [String] {
      buffer[idKey - 1] = value
      
      return filledStrings()
    }
    
    // MARK: Private functions
    private func filledStrings() -> [String] {
      var result: [String] = []
      
      while buffer[fillPointer] != nil {
        result.append(buffer[fillPointer]!)
        fillPointer += 1
      }
      
      return result
    }
  }
}

//        var aaa = Array<Int>(unsafeUninitializedCapacity: 5) { buffer, initializedCount in
//          buffer[2] = 4
//          initializedCount = 1
//        }
//        aaa[1] = 2
