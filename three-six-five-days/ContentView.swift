//
//  ContentView.swift
//  three-six-five-days
//
//  Created by Maxim Skryabin on 05.04.2022.
//

import SwiftUI

struct ContentView: View {
  @State private var dotsHeight: CGFloat = 100.0

  private let mode: CounterMode = .year
  private var date: Date {
    Date()
  }

  var body: some View {
    VStack {
      let counterPadding = 16.0
      GeometryReader { geometry in
        let viewWidth = geometry.size.width - counterPadding * 2.0

        HStack {
          DotsView(mode: mode, date: date) { dotsHeight in
            self.dotsHeight = dotsHeight
          }
            .frame(width: viewWidth * 0.7)

          CounterView(mode: mode, date: date)
            .frame(width: viewWidth * 0.3)
        }
        .padding(counterPadding)
      }
      .background(Color.customBackground)
      .cornerRadius(16.0)
      .frame(height: dotsHeight + counterPadding * 2.0)
      .padding()

      VStack(spacing: 8.0) {
        Text("Add 365days widget to your Today View or Home Screen")
          .multilineTextAlignment(.center)
          .foregroundColor(.white)
          .font(.system(size: 14.0, weight: .regular))
          .padding(.horizontal)
          .padding(.top)

        Link(destination: URL(string: "https://support.apple.com/en-gb/HT207122")!) {
          Text("How?")
            .foregroundColor(Color.customPink)
            .font(.system(size: 14.0, weight: .semibold))
        }
        .padding(.horizontal)
        .padding(.bottom)
      }
      .background(Color.customBackground)
      .cornerRadius(16.0)
    }
  }
}
