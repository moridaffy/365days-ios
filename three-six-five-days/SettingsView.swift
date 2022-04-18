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
    let colorSchemeKey = SettingsHelper.shared.getValue(of: String.self, forKey: .colorScheme) ?? ""
    selectedColorScheme = ColorScheme(rawValue: colorSchemeKey) ?? .standard
  }
  
  var body: some View {
    VStack(spacing: .zero) {
      HStack {
        Text("Select color scheme")
          .foregroundColor(.white)
          .font(.system(size: 17.0, weight: .semibold))
        Spacer()
      }
      .padding(.horizontal, 20.0)

      List(0..<ColorScheme.allCases.count) { index in
        let scheme = ColorScheme.allCases[index]

        ColorSchemeView(scheme: scheme, isSelected: scheme == selectedColorScheme)
          .onTapGesture {
            guard selectedColorScheme != scheme else { return }
            selectedColorScheme = scheme
          }
      }
    }
  }
}
