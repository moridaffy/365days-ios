//
//  SettingsHelper.swift
//  three-six-five-days
//
//  Created by Maxim Skryabin on 21.04.2022.
//

import Foundation

class SettingsManager {
  static let shared = SettingsManager()

  private let defaults = UserDefaults(suiteName: "group.ru.mskr.thee-six-five")!

  private init() { }

  func setValue(_ value: Any?, forKey key: Keys) {
    defaults.set(value, forKey: key.key)
    defaults.synchronize()
  }

  func getValue<T>(of type: T.Type, forKey key: Keys) -> T? {
    defaults.value(forKey: key.key) as? T
  }

  func deleteValue(forKey key: Keys) {
    defaults.removeObject(forKey: key.key)
    defaults.synchronize()
  }
}

extension SettingsManager {
  enum Keys: String {
    case colorScheme

    var key: String {
      return [
        rawValue
      ]
        .joined(separator: ".")
    }
  }
}
