//
//  DotView.swift
//  three-six-five-days
//
//  Created by Maxim Skryabin on 05.04.2022.
//

import SwiftUI

struct DotView: View {
  private let width: CGFloat
  private let state: DotState

  private let colorScheme = ColorSchemeManager.shared.colorScheme

  @State var isPulsating: Bool = false
  @State var opacity: CGFloat = 1.0

  init(width: CGFloat, state: DotState) {
    self.width = width
    self.state = state
  }

  var body: some View {
    Rectangle()
      .foregroundColor(colorScheme.dayColor.opacity(state.opacity))
      .frame(width: width, height: width)
      .cornerRadius(width / 2.0)
      .opacity(opacity)
      .animation(isPulsating ? Animation.easeInOut(duration: 1.0).repeatForever(autoreverses: true) : .default)
      .onAppear {
        guard !isInWidget,
              state.isPulsating else { return }
        self.isPulsating = true
        self.opacity = 0.5
      }
  }
}

extension DotView {
  enum DotState {
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
        return 0.1
      }
    }

    var isPulsating: Bool {
      self == .current
    }
  }
}
