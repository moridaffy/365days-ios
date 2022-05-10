//
//  ColorSchemeView.swift
//  three-six-five-days
//
//  Created by Maxim Skryabin on 21.04.2022.
//

import SwiftUI

struct ColorSchemeView: View {

  private let scheme: ColorScheme
  private let isSelected: Bool

  private let size: CGFloat = 32.0

  init(scheme: ColorScheme, isSelected: Bool) {
    self.scheme = scheme
    self.isSelected = isSelected
  }

  var body: some View {
    HStack {
      VStack(spacing: 4.0) {
        HStack {
          Text(scheme.title)
            .font(.system(size: 14.0, weight: .regular))
            .foregroundColor(.white)
          Spacer()
        }

        HStack {
          scheme.dayColor
            .frame(width: size, height: size)
            .cornerRadius(size / 2.0)

          scheme.percentColor
            .frame(width: size, height: size)
            .cornerRadius(size / 2.0)

          scheme.accentColor
            .frame(width: size, height: size)
            .cornerRadius(size / 2.0)

          Spacer()
        }
      }

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
