//
//  DotsView.swift
//  three-six-five-days
//
//  Created by Maxim Skryabin on 05.04.2022.
//

import SwiftUI

struct DotsView: View {
  private let mode: CounterMode
  private let date: Date

  init(mode: CounterMode, date: Date) {
    self.mode = mode
    self.date = date
  }

  var body: some View {
    GeometryReader { geometry in
      let viewWidth = geometry.size.width
      let circleBlockSize = viewWidth / CGFloat(mode.getColumnCount(for: 1))
      let circleSize = circleBlockSize * 0.8
      let spacing = circleBlockSize * 0.2

      VStack(alignment: .center, spacing: spacing) {
        ForEach(0..<mode.getRowCount(), id: \.self) { row in
          HStack(spacing: spacing) {
            ForEach(0..<mode.getColumnCount(for: row + 1), id: \.self) { column in
              DotView(
                width: circleSize,
                state: getDotState(row: row, column: column)
              )
            }
          }
        }
      }
//      .frame(height: (circleBlockSize + spacing) * CGFloat(mode.getRowCount()))
    }
  }

  private func getDotState(row: Int, column: Int) -> DotView.State {
    let day = Array(1..<row + 1)
      .compactMap { mode.getColumnCount(for: $0) }
      .reduce(0, { $0 + $1 }) + column + 1
    let currentDay = date.dayInYear

    if currentDay > day {
      return .past
    } else if currentDay == day {
      return .current
    } else {
      return .future
    }
  }
}
