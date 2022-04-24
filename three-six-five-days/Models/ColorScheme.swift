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
  case fancy

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
    case .fancy:
      return "Fancy"
    }
  }

  var dayColor: Color {
    switch self {
    case .standard:
      return .customTurquoise
    default:
      return Color("\(title)Day")
    }
  }

  var percentColor: Color {
    switch self {
    case .standard:
      return .customGreen
    default:
      return Color("\(title)Percent")
    }
  }

  var accentColor: Color {
    switch self {
    case .standard:
      return .customPink
    default:
      return Color("\(title)Accent")
    }
  }
}
