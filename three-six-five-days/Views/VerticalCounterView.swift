//
//  CounterView.swift
//  three-six-five-days
//
//  Created by Maxim Skryabin on 10.04.2022.
//

import SwiftUI

struct VerticalCounterView: View {
  // TODO: adapt VerticalCounterView to work with different modes
  private let config: VerticalCounterConfig

  init(config: VerticalCounterConfig) {
    self.config = config
  }

  var body: some View {
    let date = config.date
    let colorScheme = config.colorScheme

    return VStack {
      Text(date.year.string)
        .font(.system(size: 20.0, weight: .bold))
        .foregroundColor(colorScheme.accentColor)

      Text(date.yearCompletionPercentString)
        .font(.system(size: 16.0, weight: .semibold))
        .foregroundColor(colorScheme.percentColor)

      Text(config.dayDisplayMode.title(for: date))
        .font(.system(size: 16.0, weight: .semibold))
        .foregroundColor(colorScheme.dayColor)
    }
  }
}

struct VerticalCounterConfig {
  let date: Date

  let counterMode: CounterMode
  let dayDisplayMode: DayDisplayMode

  let colorScheme: ColorScheme

  init(
    date: Date,
    counterMode: CounterMode = .year,
    dayDisplayMode: DayDisplayMode,
    colorScheme: ColorScheme = ColorSchemeManager.shared.colorScheme
  ) {
    self.date = date
    self.counterMode = counterMode
    self.dayDisplayMode = dayDisplayMode
    self.colorScheme = colorScheme
  }
}
