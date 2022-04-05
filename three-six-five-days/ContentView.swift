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

  private var date: Date {
    Date()
  }

  var body: some View {
    VStack {
      GeometryReader { geometry in
        let viewWidth = geometry.size.width - Config.counterPadding * 2.0

        HStack {
          DotsView(mode: .year, date: date) { dotsHeight in
            self.dotsHeight = dotsHeight
          }
            .frame(width: viewWidth * 0.7)

          VStack {
            Text(date.year.string)
              .foregroundColor(.white)

            Text(date.yearCompletionPercentString)
              .foregroundColor(.white)

            Text(date.dayInYear.string + "/" + date.totalDaysInYear.string)
              .foregroundColor(.white)
          }
          .frame(width: viewWidth * 0.3)
        }
        .padding(Config.counterPadding)
      }
      .background(Color.black)
      .cornerRadius(16.0)
      .frame(height: dotsHeight + Config.counterPadding * 2.0)
      .padding()
    }
  }
}
