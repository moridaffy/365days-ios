//
//  CounterView.swift
//  three-six-five-days
//
//  Created by Maxim Skryabin on 10.04.2022.
//

import SwiftUI

struct VerticalCounterView: View {
  // TODO: adapt VerticalCounterView to work with different modes
  private let mode: CounterMode
  private let date: Date

  private let colorScheme = ColorSchemeManager.shared.colorScheme

  init(mode: CounterMode, date: Date) {
    self.mode = mode
    self.date = date
  }

  var body: some View {
    VStack {
      Text(date.year.string)
        .font(.system(size: 20.0, weight: .bold))
        .foregroundColor(colorScheme.accentColor)

      Text(date.yearCompletionPercentString)
        .font(.system(size: 16.0, weight: .semibold))
        .foregroundColor(colorScheme.percentColor)

      Text(date.dayInYear.string + "/" + date.totalDaysInYear.string)
        .font(.system(size: 16.0, weight: .semibold))
        .foregroundColor(colorScheme.dayColor)
    }
  }
}
