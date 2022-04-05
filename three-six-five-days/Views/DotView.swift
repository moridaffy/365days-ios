//
//  DotView.swift
//  three-six-five-days
//
//  Created by Maxim Skryabin on 05.04.2022.
//

import SwiftUI

struct DotView: View {
  private let width: CGFloat
  private let state: State

  init(width: CGFloat, state: State) {
    self.width = width
    self.state = state
  }

  var body: some View {
    Rectangle()
      .foregroundColor(.blue.opacity(state.opacity))
      .frame(width: width, height: width)
      .cornerRadius(width / 2.0)
  }
}

extension DotView {
  enum State {
    case past
    case current
    case future

    var opacity: CGFloat {
      switch self {
      case .past:
        return 0.5
      case .current:
        return 1.0
      case .future:
        return 0.15
      }
    }
  }
}
