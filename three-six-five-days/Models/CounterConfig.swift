//
//  CounterConfig.swift
//  three-six-five-days
//
//  Created by Max S on 30.07.2023.
//

import Foundation

struct CounterConfig {
  let date: Date

  let counterMode: CounterMode
  let dayDisplayMode: DayDisplayMode

  let colorScheme: ColorScheme

  init(
    date: Date,
    counterMode: CounterMode,
    dayDisplayMode: DayDisplayMode = DayDisplayModeManager.shared.dayDisplayMode,
    colorScheme: ColorScheme = ColorSchemeManager.shared.colorScheme
  ) {
    self.date = date
    self.counterMode = counterMode
    self.dayDisplayMode = dayDisplayMode
    self.colorScheme = colorScheme
  }
}
