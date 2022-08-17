//
//  EasyStringArrayTasks.swift
//  Algorithms
//
//  Created by Igor Ratynski on 18.08.2022.
//

import Foundation

// MARK: Execute strings
extension Solution.Easy {
  /* ["firstVar = 5", "secondVar = firstVar", "{", "thirdVar = secondVar", "{", "thirdVar = 5", "secondVar = thirdVar", "}", "}"] */
  func execute(strings: [String]) {
    typealias Scope = [String:Int]
    var stack: [Scope] = [Scope()], scopeLevel = 0, values: [String], isFound: Bool
    
    for currentString in strings {
//      guard currentString != nil || !(currentString?.isEmpty ?? true) else { break }
      switch currentString {
        case "{":
          stack.append(Scope())
          scopeLevel += 1
        case "}":
          stack.removeLast()
          scopeLevel -= 1
        default:
          values = currentString.split(separator: "=").compactMap { String($0) }
          
          if let digit = Int(values[1]) {
            stack[scopeLevel][values[0]] = digit
          } else {
            isFound = false
            for index in stride(from: scopeLevel, through: 0, by: -1) {
              if stack[index].keys.contains(values[1]) {
                isFound = true
                stack[scopeLevel][values[0]] = stack[index][values[1]]
                break
              }
            }
            if !isFound {
              stack[scopeLevel][values[0]] = 0
            }
            print(stack[scopeLevel][values[0]]!)
          }
      }
    }
  }
}
