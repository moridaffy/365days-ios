//
//  ContentView.swift
//  three-six-five-days
//
//  Created by Maxim Skryabin on 05.04.2022.
//

import SwiftUI

struct ContentView: View {
  private var date: Date {
    Date()
  }

  var body: some View {
    VStack {
      GeometryReader { geometry in
        HStack {
          DotsView(mode: .year, date: date)
            .frame(width: geometry.size.width * 0.7)

          VStack {
            Text(date.year.string)
              .foregroundColor(.white)

            Text(date.yearCompletionPercentString)
              .foregroundColor(.white)

            Text(date.dayInYear.string + "/" + date.totalDaysInYear.string)
              .foregroundColor(.white)
          }
          .frame(width: geometry.size.width * 0.3)
        }
        .padding()
      }
      .background(Color.black)
      .cornerRadius(16.0)
      .padding()
    }
    .background(Color.gray)
  }
}

struct ContentView_Previews: PreviewProvider {
  static var previews: some View {
    ContentView()
  }
}
