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
  private let onAppear: (CGFloat) -> Void

  init(mode: CounterMode, date: Date, onAppear: @escaping (CGFloat) -> Void) {
    self.mode = mode
    self.date = date
    self.onAppear = onAppear
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
                state: getDotState(row: row + 1, column: column + 1)
              )
            }
          }
        }
      }
      .onAppear {
        let dotsHeight = CGFloat(mode.getRowCount()) * (circleSize + spacing)
        onAppear(dotsHeight)
      }
    }
  }

  private func getDotState(row: Int, column: Int) -> DotView.DotState {
    let day = Array(1..<row)
      .compactMap { mode.getColumnCount(for: $0) }
      .reduce(0, { $0 + $1 }) + column
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
