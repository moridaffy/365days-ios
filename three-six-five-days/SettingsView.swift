//
//  SettingsView.swift
//  three-six-five-days
//
//  Created by Maxim Skryabin on 21.04.2022.
//

import SwiftUI

import DevCred

struct SettingsView: View {

  @State private var selectedColorScheme: ColorScheme

  @State private var devCredPresented = false

  init() {
    selectedColorScheme = ColorSchemeManager.shared.colorScheme
  }
  
  var body: some View {
    // TODO: find a better way to change List's background color
    UITableView.appearance().backgroundColor = .clear

    return VStack(spacing: .zero) {
      HStack {
        Text("Select color scheme")
          .foregroundColor(.primary)
          .font(.system(size: 17.0, weight: .semibold))
        Spacer()
      }
      .padding(.horizontal, 20.0)

      List(0..<ColorScheme.allCases.count) { index in
        let scheme = ColorScheme.allCases[index]

        ColorSchemeView(scheme: scheme, isSelected: scheme == selectedColorScheme)
          .onTapGesture {
            didSelectColorScheme(scheme)
          }
      }
    }
    .toolbar {
      ToolbarItem(placement: .navigationBarTrailing) {
        Button {
          devCredPresented = true
        } label: {
          Image(systemName: "person.crop.circle.badge.questionmark")
            .renderingMode(.template)
            .foregroundColor(selectedColorScheme.accentColor)
        }
      }
    }
    .sheet(isPresented: $devCredPresented) {
      DevCredRepresentable(config: .init(
        infoSource: .remote(url: "https://mxm.codes/devcred.json"),
        excludedBundleId: ConstantHelper.bundleId,
        presentationType: .modal,
        accentColor: selectedColorScheme.accentColor.uiColor
      ))
    }
  }

  private func didSelectColorScheme(_ scheme: ColorScheme) {
    guard selectedColorScheme != scheme else { return }

    selectedColorScheme = scheme
    ColorSchemeManager.shared.colorScheme = scheme
  }
}

private extension Color {
  var uiColor: UIColor {
    UIColor(self)
  }
}

struct DevCredRepresentable: UIViewControllerRepresentable {
  typealias UIViewControllerType = UIViewController

  private let config: DevCredConfig

  init(config: DevCredConfig) {
    self.config = config
  }

  func makeUIViewController(context: Context) -> UIViewController {
    let controller = DevCredRootView.build(config)
    return UINavigationController(rootViewController: controller)
  }

  func updateUIViewController(_ uiViewController: UIViewController, context: Context) { }
}
