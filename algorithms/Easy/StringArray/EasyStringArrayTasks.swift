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

// MARK: 744. Find smallest letter greater than target
extension Solution.Easy {
  func nextGreatestLetter(_ letters: [Character], _ target: Character) -> Character {
    var alphabet: [Character] = ["a", "b", "c", "d", "e", "f", "g", "h", "i", "j", "k", "l", "m", "n", "o", "p", "q", "r", "s", "t", "u", "v", "w", "x", "y", "z"], target = target
    
    let leftPart = alphabet.dropFirst( alphabet.lastIndex(where: { $0 == target })! + 1 )
    let rightPart = alphabet.dropLast( leftPart.count + 1)
    
    alphabet = Array(leftPart) + Array(rightPart)
    
    while true {
      target = alphabet.removeFirst()
      guard letters.contains(target) else { continue }
      return target
    }
  }
}

// MARK: 2011. Final Value of Variable After Performing Operations
extension Solution.Easy {
  func finalValueAfterOperations(_ operations: [String]) -> Int {
    var result = 0, index = operations.first!.index(after: operations.first!.startIndex)
    operations.forEach { result = $0[index] == "+" ? result + 1 : result - 1 }
    return result
  }
}

// MARK: 1773. Count Items Matching a Rule
extension Solution.Easy {
  func countMatches(_ items: [[String]], _ ruleKey: String, _ ruleValue: String) -> Int {
    let ruleNumber: Int
    var result = 0
    
    switch ruleKey {
      case "type": ruleNumber = 0
      case "color": ruleNumber = 1
      default: ruleNumber = 2 // "name". in prod 4 default case would be preffered another behaviour
    }
    
    for item in items {
      guard item[ruleNumber] == ruleValue else { continue }
      result += 1
    }
    
    return result
  }
}

// MARK: 1662. Check If Two String Arrays are Equivalent
extension Solution.Easy {
  func arrayStringsAreEqual(_ word1: [String], _ word2: [String]) -> Bool {
    // I
//    word1.joined() == word2.joined()
    
    // II
    var word1Index = 0, word2Index = 0, leftIndex = word1[0].startIndex, leftEndIndex = word1[0].endIndex, rightIndex = word2[0].startIndex, rightEndIndex = word2[0].endIndex
    
    
    func move(index: inout String.Index, checkBy endIndex: inout String.Index, in word: [String], with wordIndex: inout Int) {
      index = word[wordIndex].index(after: index)
      
      guard index == endIndex else { return }
      wordIndex += 1
      
      guard wordIndex < word.count else { return }
      index = word[wordIndex].startIndex
      endIndex = word[wordIndex].endIndex
    }
    
    while word1Index < word1.count, word2Index < word2.count {
      guard word1[word1Index][leftIndex] == word2[word2Index][rightIndex] else { return false }
      
      move(index: &leftIndex, checkBy: &leftEndIndex, in: word1, with: &word1Index)
      move(index: &rightIndex, checkBy: &rightEndIndex, in: word2, with: &word2Index)
    }
    
    return leftIndex == leftEndIndex && rightIndex == rightEndIndex
  }
}
