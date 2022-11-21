//
//  EasyQueueTasks.swift
//  Algorithms
//
//  Created by Igor Ratynski on 26.08.2022.
//

import Foundation

// MARK: Implement fifo queue by array
extension Solution.Easy {
  class MyQueue {
    
    // MARK: Properties
    private var stack: [Int] = []
    
    // MARK: Init
    init() { }
    
    // MARK: Functions
    func push(_ x: Int) {
      stack.append(x)
    }
    
    func pop() -> Int {
      stack.removeFirst()
    }
    
    func peek() -> Int {
      stack.first!
    }
    
    func empty() -> Bool {
      stack.isEmpty
    }
  }
}

// MARK: Implement stack by array
extension Solution.Easy {
  class MyStack {
    
    // MARK: Properties
    private var stack: [Int] = []
    
    // MARK: Init
    init() { }
    
    // MARK: Functions
    func push(_ x: Int) {
      stack.append(x)
    }
    
    func pop() -> Int {
      stack.removeLast()
    }
    
    func top() -> Int {
      stack.last!
    }
    
    func empty() -> Bool {
      stack.isEmpty
    }
  }
}

