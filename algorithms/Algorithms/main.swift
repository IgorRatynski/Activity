//
//  main.swift
//  Algorithms
//
//  Created by Igor Ratynski on 17.07.2022.
//

import Foundation

//Solution.Easy().testLetterCombinations()

Solution.Easy().test()

//let n = 5
//var input =
//"""
//MIKHAIL VLADISLAV GRIGORY
//VLADISLAV MIKHAIL GRIGORY
//IVAN ILYA VLADIMIR
//ANDREY VLADIMIR ILYA
//VLADIMIR IVAN ANDREY
//"""
//
//let b = input.split(separator: "\n").map { $0.split(separator: " ").sorted() }
////  .split(separator: " ")
////  .sorted { $0 < $1 }
//
//print(b)
//
//var countArray: [Int], domainsArray: [String] = [], buyersArray: [[String]] = [], tempString: String?
//
//while true {
//  countArray = (readLine() ?? "").split(separator: " ").compactMap { Int($0) }
//  guard countArray.count == 2 else { continue }
//
//  while domainsArray.count < countArray[0] {
//    tempString = readLine()
//    guard tempString != nil else { continue }
//    domainsArray.append(tempString!)
//  }
//
//  while buyersArray.count < countArray[1] {
//    tempString = readLine()
//    guard tempString != nil else { continue }
//    buyersArray.append(tempString!.split(separator: " ").map { String($0) })
//  }
//
//  var count: Int
//
//  for buyer in buyersArray {
//    count = 0
//    for domain in domainsArray {
//      guard domain.hasPrefix(buyer[0]) && domain.hasSuffix(buyer[1]) else { continue }
//      count += 1
//    }
//    print(count)
//  }
//
//  break
//}



//while true {
//  guard var floorCount = Int(readLine() ?? "") else { continue }
//  var lifts: [[Int]] = []
//
//  while floorCount > lifts.count {
//    guard let lift = readLine()?.split(separator: " ").compactMap({ Int($0) }), lift.count == 2 else { continue }
//    lifts.append(lift)
//  }
//
//  lifts.sort { $0[0] == $1[0] ? $0[1] > $1[1] : $0[0] > $1[0] }
//  var currentFloor = 0
//  // TODO: Перебрать все возможные варианты тк может быть такое что ехать на следующий после минимально возможного варианта выгоднее
//  // Ну и условия конечно такое себе - leetcode гораздо лучше понимаю чем эти, больше заняло времени понимать что надо, чем решать...
//  break
//}

