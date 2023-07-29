//
//  DayDisplayMode.swift
//  three-six-five-days
//
//  Created by Max S on 29.07.2023.
//

import Foundation

enum DayDisplayMode: String, CaseIterable {
  static var `default`: Self {
    .currentOutOfTotal
  }

  case currentOutOfTotal = "current_total"
  case current
  case left

  func title(for date: Date) -> String {
    switch self {
    case .currentOutOfTotal:
      return date.dayInYear.string + "/" + date.totalDaysInYear.string

    case .current:
      return date.dayInYear.string

    case .left:
      return (date.totalDaysInYear - date.dayInYear).string
    }
  }
}

extension DayDisplayMode: Identifiable {
  var id: Self {
    self
  }
}
