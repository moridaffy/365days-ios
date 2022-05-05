//
//  SettingsView.swift
//  three-six-five-days
//
//  Created by Maxim Skryabin on 21.04.2022.
//

import SwiftUI

struct SettingsView: View {

  @State private var selectedColorScheme: ColorScheme

  init() {
    selectedColorScheme = ColorSchemeManager.shared.colorScheme
  }
  
  var body: some View {
    // TODO: find a better way to change List's background color
    UITableView.appearance().backgroundColor = .clear

    return VStack(spacing: .zero) {
      HStack {
        Text("Select color scheme")
          .foregroundColor(.primary)
          .font(.system(size: 17.0, weight: .semibold))
        Spacer()
      }
      .padding(.horizontal, 20.0)

      List(0..<ColorScheme.allCases.count) { index in
        let scheme = ColorScheme.allCases[index]

        ColorSchemeView(scheme: scheme, isSelected: scheme == selectedColorScheme)
          .onTapGesture {
            didSelectColorScheme(scheme)
          }
      }
    }
  }

  private func didSelectColorScheme(_ scheme: ColorScheme) {
    guard selectedColorScheme != scheme else { return }

    selectedColorScheme = scheme
    ColorSchemeManager.shared.colorScheme = scheme
  }
}
