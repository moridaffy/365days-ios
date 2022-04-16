//
//  ColorScheme.swift
//  three-six-five-days
//
//  Created by Maxim Skryabin on 21.04.2022.
//

import SwiftUI

enum ColorScheme: String, CaseIterable {
  case standard
  case herbal
  case pinky
  case ocean

  var title: String {
    switch self {
    case .standard:
      return "Standard"
    case .herbal:
      return "Herbal"
    case .pinky:
      return "Pinky"
    case .ocean:
      return "Ocean"
    }
  }

  var dayColor: Color {
    switch self {
    case .standard:
      return .customTurquoise
    default:
      return .white
    }
  }

  var percentColor: Color {
    switch self {
    case .standard:
      return .customGreen
    default:
      return .white
    }
  }

  var accentColor: Color {
    switch self {
    case .standard:
      return .customPink
    default:
      return .white
    }
  }
}
