//
//  ContentView.swift
//  three-six-five-days
//
//  Created by Maxim Skryabin on 05.04.2022.
//

import SwiftUI

struct ContentView: View {
  private enum Config {
    static let counterPadding: CGFloat = 16.0
  }

  @State private var dotsHeight: CGFloat = 100.0

  private let mode: CounterMode = .year
  private var date: Date {
    Date()
  }

  var body: some View {
    VStack {
      GeometryReader { geometry in
        let viewWidth = geometry.size.width - Config.counterPadding * 2.0

        HStack {
          DotsView(mode: mode, date: date) { dotsHeight in
            self.dotsHeight = dotsHeight
          }
            .frame(width: viewWidth * 0.7)

          CounterView(mode: mode, date: date)
            .frame(width: viewWidth * 0.3)
        }
        .padding(Config.counterPadding)
      }
      .background(Color.customBackground)
      .cornerRadius(16.0)
      .frame(height: dotsHeight + Config.counterPadding * 2.0)
      .padding()
    }
  }
}
