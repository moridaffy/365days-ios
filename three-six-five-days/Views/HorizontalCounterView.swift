//
//  HorizontalCounterView.swift
//  three-six-five-days
//
//  Created by Maxim Skryabin on 11.04.2022.
//

import SwiftUI

struct HorizontalCounterView: View {
  // TODO: adapt HorizontalCounterView to work with different modes
  private let config: CounterConfig

  init(config: CounterConfig) {
    self.config = config
  }

  var body: some View {
    let date = config.date
    let colorScheme = config.colorScheme

    return VStack(spacing: 2.0) {
      HStack(spacing: 0.0) {
        Text(date.yearCompletionPercentString)
          .font(.system(size: 12.0, weight: .semibold))
          .foregroundColor(colorScheme.percentColor)
          .frame(maxWidth: .infinity)

        Text(config.dayDisplayMode.title(for: date))
          .font(.system(size: 12.0, weight: .semibold))
          .foregroundColor(colorScheme.dayColor)
          .frame(maxWidth: .infinity)
      }

      Text(date.year.string)
        .font(.system(size: 20.0, weight: .bold))
        .foregroundColor(colorScheme.accentColor)
        .frame(maxWidth: .infinity)
    }
  }
}
