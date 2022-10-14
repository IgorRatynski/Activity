//
//  ParkingSystem.swift
//  Algorithms
//
//  Created by Igor Ratynski on 04.12.2022.
//

import Foundation

// MARK: 1603. Design Parking System
extension Solution.Easy {
  
  class ParkingSystem {
    
    // MARK: Properties
    private var bigCarsSpace: Int
    private var mediumCarsSpace: Int
    private var smallCarsSpace: Int
    
    // MARK: Lifecycle
    init(_ big: Int, _ medium: Int, _ small: Int) {
      bigCarsSpace = big
      mediumCarsSpace = medium
      smallCarsSpace = small
    }
    
    // MARK: Functions
    func addCar(_ carType: Int) -> Bool {
      switch carType {
        case 1:
          guard bigCarsSpace > 0 else { return false }
          bigCarsSpace -= 1
        case 2:
          guard mediumCarsSpace > 0 else { return false }
          mediumCarsSpace -= 1
        default:
          guard carType == 3, smallCarsSpace > 0 else { return false }
          smallCarsSpace -= 1
      }
      return true
    }
  }
}
