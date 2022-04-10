//
//  View+Widget.swift
//  three-six-five-days
//
//  Created by Maxim Skryabin on 10.04.2022.
//

import SwiftUI

extension View {
  var isInWidget: Bool {
    guard let nsExtension = Bundle.main.infoDictionary?["NSExtension"] as? [String: String],
          let widgetExtension = nsExtension["NSExtensionPointIdentifier"] else { return false }
    return widgetExtension == "com.apple.widgetkit-extension"
  }
}
