//
//  EasyIntTasks.swift
//  Easy
//
//  Created by Igor Ratynski on 22.07.2022.
//

import Foundation

// MARK: Is happy
extension Solution.Easy {
  func isHappy(_ n: Int) -> Bool {
    var n = n, tempResult: Int, tempLast: Int, cache = Set<Int>()
    
    while !cache.contains(n) {
      if n == 1 {
        return true
      } else {
        cache.insert(n)
      }
      
      tempResult = 0
      while n > 9 {
        tempLast = n % 10
        n = n / 10
        tempResult += tempLast * tempLast
      }
      
      tempResult += n * n
      n = tempResult
    }
    
    return false
  }
}

// MARK: Climb stairs
extension Solution.Easy {
  func climbStairs(_ n: Int) -> Int {
    fibonacciRecursive(num1: 1, num2: 1, steps: n)
  }
}

// MARK: Fibonacci n
extension Solution.Easy {
  func fib(_ n: Int) -> Int {
    fibonacciRecursive(num1: 0, num2: 1, steps: n)
  }
}

// MARK: Supporting: climb stairs, fibonacci n
private extension Solution.Easy {
  func fibonacciRecursive(num1: Int, num2: Int, steps: Int) -> Int {
    steps > 0 ? fibonacciRecursive(num1: num2, num2: num1 + num2, steps: steps - 1) : num1
  }
}

// MARK: Generate Pascal's triangle I
extension Solution.Easy {
  func generate(_ numRows: Int) -> [[Int]] {
    guard numRows > 1 else { return [[1]] }
    var result: [[Int]] = [[1], [1,1]], temp: [Int], prev: Int
    
    for iteration in 2..<numRows {
      prev = iteration - 1
      temp = [1]
      for lineIndex in 1..<iteration {
        // TODO: optimization: count a half of line after get values
        temp.append(result[prev][lineIndex - 1] + result[prev][lineIndex])
      }
      temp.append(1)
      result.append(temp)
    }
    
    return result
  }
}

// MARK: Generate Pascal's triangle II
extension Solution.Easy {
  func getRow(_ rowIndex: Int) -> [Int] {
    guard rowIndex > 0 else { return [1] }
    var result = [[1], [1,1]], temp: [Int]
    
    for iteration in 2..<rowIndex + 1 {
      result[0] = result[1]
      temp = [1]
      // TODO: optimization: count a half of line after get values
      for lineIndex in 1..<iteration {
        temp.append(result[0][lineIndex - 1] + result[0][lineIndex])
      }
      temp.append(1)
      result[1] = temp
    }
    
    return result.last!
  }
}

// MARK: Check ones segment
extension Solution.Easy {
  func checkOnesSegment(_ s: String) -> Bool {
    var filter = "01"
    for current in s {
      guard current == filter.first else { continue }
      filter.removeFirst()
      guard !filter.isEmpty else { return false }
    }
    
    return true
  }
}

// MARK: Max power
extension Solution.Easy {
  func maxPower(_ s: String) -> Int {
    var s = s, current = s.removeFirst(), count = 0, tempCount = 1
    
    for char in s {
      if char == current {
        tempCount += 1
      } else {
        if count < tempCount {
          count = tempCount
        }
        tempCount = 1
        current = char
      }
    }
    
    return max(count, tempCount)
  }
}

// MARK: 728. Self dividing numbers
extension Solution.Easy {
  func selfDividingNumbers(_ left: Int, _ right: Int) -> [Int] {
    var string: String, result: [Int] = [], isValid: Bool
    for number in left...right {
      isValid = true
      string = String(number)
      guard !string.contains("0") else { continue }
      while !string.isEmpty {
        guard number % Int(String(string.removeLast()))! != 0 else { continue }
        isValid = false
        break
      }
      
      guard isValid else { continue }
      result.append(number)
    }
    
    return result
  }
}

// MARK: 507. Perfect number
extension Solution.Easy {
  func checkPerfectNumber(_ num: Int) -> Bool {
    guard num > 1 else { return false }
    var result = 0
    
    for devider in 1...num/2 {
      guard num % devider == 0 else { continue }
      result += devider
    }
    return result == num
  }
}

// MARK: 258. Add Digits
extension Solution.Easy {
  func addDigits(_ num: Int) -> Int {
    guard num > 9 else { return num }
    return addDigits(addDigits(num / 10) + addDigits(num % 10))
  }
}

// MARK: 2283. Check if Number Has Equal Digit Count and Digit Value
extension Solution.Easy {
  func digitCount(_ num: String) -> Bool {
    var index = num.startIndex, digit: Character, string: String, count: Int
    
    for i in 0..<num.count {
      digit = num[index]
      string = String(i)
      count = Int(String(digit))!
      
      for subdigit in num {
        guard String(subdigit) == string else { continue }
        count -= 1
      }
      guard count == 0 else { return false }
      index = num.index(after: index)
    }
    
    return true
  }
}

// MARK: 441. Arranging Coins
extension Solution.Easy {
  func arrangeCoins(_ n: Int) -> Int {
    var result = 1, n = n - 1
    
    while result < n {
      result += 1
      n -= result
    }
    
    return result
  }
}

// MARK: 2413. Smallest Even Multiple
extension Solution.Easy {
  func smallestEvenMultiple(_ n: Int) -> Int {
    n % 2 == 0 ? n : n * 2
  }
}

// MARK: 1281. Subtract the Product and Sum of Digits of an Integer
extension Solution.Easy {
  func subtractProductAndSum(_ n: Int) -> Int {
    var digits: [Int] = [], n = n
    
    while n > 0 {
      digits.append(n % 10)
      n = n / 10
    }
    
    return digits.reduce(1, *) - digits.reduce(0, +)
  }
}

// MARK: 2427. Number of Common Factors
extension Solution.Easy {
  func commonFactors(_ a: Int, _ b: Int) -> Int {
    let min = Float(min(a, b)), max = Float(max(a, b))
    guard min > 1 else { return 1 }
    var result = 1, divider: Float
    
    for i in 2...Int(min) {
      divider = Float(i)
      guard (min / divider).truncatingRemainder(dividingBy: 1) == 0,
            (max / divider).truncatingRemainder(dividingBy: 1) == 0
      else { continue }
      result += 1
    }
    
    return result
  }
}

// MARK: 2235. Add Two Integers
extension Solution.Easy {
  func sum(_ num1: Int, _ num2: Int) -> Int {
      num1 + num2
  }
}

// MARK: 2160. Minimum Sum of Four Digit Number After Splitting Digits
extension Solution.Easy {
  func minimumSum(_ num: Int) -> Int {
    var digits: [Int] = [], num = num, ten = 10
    
    while num > 0 {
      digits.append(num % ten)
      num /= ten
    }
    
    digits.sort()
    
    return (digits[0] * ten + digits[2]) + (digits[1] * ten + digits[3])
  }
}

// MARK: 1342. Number of Steps to Reduce a Number to Zero
extension Solution.Easy {
  func numberOfSteps(_ num: Int) -> Int {
    var result = 0, num = num
    
    while num > 0 {
      if num % 2 == 0 {
        num /= 2
      } else {
        num -= 1
      }
      result += 1
    }
    
    return result
  }
}

// MARK: 1688. Count of Matches in Tournament
extension Solution.Easy {
  func numberOfMatches(_ n: Int) -> Int {
    n - 1
  }
}
}
