//
//  CounterMode.swift
//  three-six-five-days
//
//  Created by Maxim Skryabin on 05.04.2022.
//

import Foundation

enum CounterMode {
  case year

  var totalDots: Int {
    switch self {
    case .year:
      return Date().totalDaysInYear
    }
  }

  func getRowCount() -> Int {
    switch self {
    case .year:
      return 12
    }
  }

  func getColumnCount(for row: Int) -> Int {
    switch self {
    case .year:
      if row != getRowCount() {
        return row % 2 == 0 ? 30 : 31
      } else {
        return totalDots == 366 ? 30 : 29
      }
    }
  }
}
