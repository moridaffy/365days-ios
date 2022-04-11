//
//  three_six_five_widget.swift
//  three-six-five-widget
//
//  Created by Maxim Skryabin on 10.04.2022.
//

import WidgetKit
import SwiftUI
import Intents

struct Provider: IntentTimelineProvider {
  func placeholder(in context: Context) -> WidgetEntry {
    WidgetEntry(mode: .year, date: Date())
  }

  func getSnapshot(for configuration: ConfigurationIntent, in context: Context, completion: @escaping (WidgetEntry) -> ()) {
    let entry = WidgetEntry(mode: .year, date: Date())
    completion(entry)
  }

  func getTimeline(for configuration: ConfigurationIntent, in context: Context, completion: @escaping (Timeline<Entry>) -> ()) {
    var entries: [WidgetEntry] = []

    // Generate a timeline consisting of five entries an hour apart, starting from the current date.
    let currentDate = Date()
    for dayOffset in 0 ..< 5 {
      let entryDate = Calendar.current.date(byAdding: .day, value: dayOffset, to: currentDate)!
      let entry = WidgetEntry(mode: .year, date: entryDate)
      entries.append(entry)
    }

    let timeline = Timeline(entries: entries, policy: .atEnd)
    completion(timeline)
  }
}

struct WidgetEntry: TimelineEntry {
  let mode: CounterMode
  let date: Date
}

// MARK: - Medium widget

struct MediumWidgetView: View {
  @State private var dotsHeight: CGFloat = 100.0

  var entry: Provider.Entry

  var body: some View {
    let counterPadding = 16.0

    GeometryReader { geometry in
      let viewWidth = geometry.size.width - counterPadding * 2.0

      HStack {
        DotsView(mode: entry.mode, date: entry.date, smallerDots: true) { dotsHeight in
          self.dotsHeight = dotsHeight
        }
          .frame(width: viewWidth * 0.7)

        VerticalCounterView(mode: entry.mode, date: entry.date)
          .frame(width: viewWidth * 0.3)
      }
      .padding(counterPadding)
    }
    .frame(height: dotsHeight + counterPadding * 2.0)
  }
}

struct MediumWidget: Widget {
  let kind: String = "medium_widget"

  var body: some WidgetConfiguration {
    IntentConfiguration(kind: kind, intent: ConfigurationIntent.self, provider: Provider()) { entry in
      MediumWidgetView(entry: entry)
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(Color.customBackground)
    }
    .supportedFamilies([.systemMedium])
    .configurationDisplayName("365days")
    .description("Track year progress")
  }
}

// MARK: - Small widget

struct SmallWidgetView: View {
  @State private var dotsHeight: CGFloat = 100.0

  var entry: Provider.Entry

  var body: some View {
    let counterPadding = 16.0

    VStack {
      DotsView(mode: entry.mode, date: entry.date, smallerDots: false) { dotsHeight in
        self.dotsHeight = dotsHeight
      }

      HorizontalCounterView(mode: entry.mode, date: entry.date)
    }
    .padding(counterPadding)
  }
}

struct SmallWidget: Widget {
  let kind: String = "small_widget"

  var body: some WidgetConfiguration {
    IntentConfiguration(kind: kind, intent: ConfigurationIntent.self, provider: Provider()) { entry in
      SmallWidgetView(entry: entry)
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(Color.customBackground)
    }
    .supportedFamilies([.systemSmall])
    .configurationDisplayName("365days")
    .description("Track year progress")
  }
}

@main
struct CardioBotWidgets: WidgetBundle {
    var body: some Widget {
        MediumWidget()
        SmallWidget()
    }
}
