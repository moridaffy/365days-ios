//
//  Date+Helpers.swift
//  three-six-five-days
//
//  Created by Maxim Skryabin on 05.04.2022.
//

import Foundation

extension Date {
  var totalDaysInYear: Int {
    return Calendar.current.range(of: .day, in: .year, for: self)?.count ?? 123
  }

  var dayInYear: Int {
    let calendar = Calendar.current
    let year = year
    let month = calendar.component(.month, from: self)

    var days: Int = Array(1..<month)
      .compactMap { monthIndex in
        guard let date = calendar.date(from: DateComponents(year: year, month: monthIndex)) else { return nil }
        return calendar.range(of: .day, in: .month, for: date)?.count
      }
      .reduce(0, { $0 + $1 })
    days += calendar.component(.day, from: self)

    return days
  }

  var year: Int {
    return Calendar.current.component(.year, from: self)
  }

  var yearCompletionPercentString: String {
    let percent = Double(dayInYear) / Double(totalDaysInYear) * 100.0
    return String(format: "%.2f", percent) + "%"
  }
}
