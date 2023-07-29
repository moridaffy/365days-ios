//
//  Color+CustomColors.swift
//  three-six-five-days
//
//  Created by Maxim Skryabin on 10.04.2022.
//

import SwiftUI
import UIKit

extension Color {
  static var customBackground: Color {
    Color("background")
  }

  static var customTurquoise: Color {
    Color("turquoise")
  }

  static var customPink: Color {
    Color("pink")
  }

  static var customGreen: Color {
    Color("green")
  }
}

extension Color {
  var uiColor: UIColor {
    UIColor(self)
  }
}
