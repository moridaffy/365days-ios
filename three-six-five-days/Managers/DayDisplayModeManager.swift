//
//  DayDisplayModeManager.swift
//  three-six-five-days
//
//  Created by Max S on 29.07.2023.
//

import Foundation
import WidgetKit

class DayDisplayModeManager {
  static let shared = DayDisplayModeManager()

  var dayDisplayMode: DayDisplayMode {
    get {
      DayDisplayMode(rawValue: SettingsManager.shared.getValue(of: String.self, forKey: .dayDisplayMode) ?? "") ?? .default
    }
    set {
      SettingsManager.shared.setValue(newValue.rawValue, forKey: .dayDisplayMode)
      WidgetCenter.shared.reloadAllTimelines()
    }
  }
}

