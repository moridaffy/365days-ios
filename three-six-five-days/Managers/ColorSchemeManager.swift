//
//  ColorSchemeManager.swift
//  three-six-five-days
//
//  Created by Maxim Skryabin on 24.04.2022.
//

import Foundation

class ColorSchemeManager {
  static let shared = ColorSchemeManager()

  var colorScheme: ColorScheme {
    get {
      ColorScheme(rawValue: SettingsManager.shared.getValue(of: String.self, forKey: .colorScheme) ?? "") ?? .standard
    }
    set {
      SettingsManager.shared.setValue(newValue.rawValue, forKey: .colorScheme)
      NotificationCenter.default.post(name: .colorSchemeChanged, object: nil)
    }
  }
}
