//
//  SettingsHelper.swift
//  three-six-five-days
//
//  Created by Maxim Skryabin on 21.04.2022.
//

import Foundation

class SettingsHelper {
  static let shared = SettingsHelper()

  private let defaults = UserDefaults.standard

  private init() { }

  func setValue(_ value: Any?, forKey key: Keys) {
    defaults.set(value, forKey: key.key)
  }

  func getValue<T>(of type: T.Type, forKey key: Keys) -> T? {
    defaults.value(forKey: key.key) as? T
  }

  func deleteValue(forKey key: Keys) {
    defaults.removeObject(forKey: key.key)
  }
}

extension SettingsHelper {
  enum Keys: String {
    case colorScheme

    var key: String {
      return [
        Bundle.main.bundleIdentifier ?? "ru.mskr.three-six-five-days",
        rawValue
      ]
        .joined(separator: ".")
    }
  }
}
