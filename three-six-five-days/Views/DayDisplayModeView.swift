//
//  DayDisplayModeView.swift
//  three-six-five-days
//
//  Created by Max S on 29.07.2023.
//

import Foundation
import SwiftUI

struct DayDisplayModeView: View {

  private let mode: DayDisplayMode
  private let isSelected: Bool

  init(mode: DayDisplayMode, isSelected: Bool) {
    self.mode = mode
    self.isSelected = isSelected
  }

  var body: some View {
    HStack {
      Text(mode.title(for: Date()))
        .font(.system(size: 16.0, weight: .regular))
        .foregroundColor(.white)

      Spacer()

      Image(systemName: "checkmark")
        .renderingMode(.template)
        .foregroundColor(.customPink)
        .opacity(isSelected ? 1.0 : 0.0)
    }
    .padding(.vertical, 4.0)
    .background(Color.customBackground)
    .listRowBackground(Color.customBackground)
  }
}
