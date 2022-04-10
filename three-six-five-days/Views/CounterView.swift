//
//  CounterView.swift
//  three-six-five-days
//
//  Created by Maxim Skryabin on 10.04.2022.
//

import SwiftUI

struct CounterView: View {
  // TODO: adapt CounterView to work with different modes
  private let mode: CounterMode
  private let date: Date

  init(mode: CounterMode, date: Date) {
    self.mode = mode
    self.date = date
  }

  var body: some View {
    VStack {
      Text(date.year.string)
        .font(.system(size: 20.0, weight: .bold))
        .foregroundColor(.customPink)

      Text(date.yearCompletionPercentString)
        .font(.system(size: 18.0, weight: .semibold))
        .foregroundColor(.customGreen)

      Text(date.dayInYear.string + "/" + date.totalDaysInYear.string)
        .font(.system(size: 18.0, weight: .semibold))
        .foregroundColor(.customTurquoise)
    }
  }
}
