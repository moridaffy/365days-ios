//
//  CounterView.swift
//  three-six-five-days
//
//  Created by Maxim Skryabin on 10.04.2022.
//

import SwiftUI

struct VerticalCounterView: View {
  // TODO: adapt VerticalCounterView to work with different modes
  private let config: CounterConfig

  init(config: CounterConfig) {
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
