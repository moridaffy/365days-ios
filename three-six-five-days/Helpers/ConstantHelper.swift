//
//  ConstantHelper.swift
//  three-six-five-days
//
//  Created by Maxim Skryabin on 10.05.2022.
//

import Foundation

enum ConstantHelper {
  static var bundleId: String {
    Bundle.main.bundleIdentifier ?? "ru.mskr.three-six-five-days"
  }
}
