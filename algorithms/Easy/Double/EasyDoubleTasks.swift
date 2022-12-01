//
//  EasyDoubleTasks.swift
//  Easy
//
//  Created by Igor Ratynski on 15.10.2022.
//

import Foundation

// MARK: 2469. Convert the Temperature
extension Solution.Easy {
  func convertTemperature(_ celsius: Double) -> [Double] {
    [celsius + 273.15, celsius * 1.80 + 32.00]
  }
}
