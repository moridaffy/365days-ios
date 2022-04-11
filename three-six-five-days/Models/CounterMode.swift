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

  func getRowCount(smallerDots: Bool) -> Int {
    switch self {
    case .year:
      return smallerDots ? 12 : 15
    }
  }

  func getColumnCount(for row: Int, smallerDots: Bool) -> Int {
    switch self {
    case .year:
      if smallerDots {
        if row != getRowCount(smallerDots: smallerDots) {
          return row % 2 == 0 ? 30 : 31
        } else {
          return totalDots == 366 ? 30 : 29
        }
      } else {
        if row != getRowCount(smallerDots: smallerDots) {
          return row % 3 == 0 ? 25 : 24
        } else {
          return totalDots == 366 ? 26 : 25
        }
      }
    }
  }
}
