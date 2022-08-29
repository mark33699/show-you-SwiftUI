//
//  ContentView.swift
//  FDLS
//
//  Created by Mark HsieH on 2022/8/17.
//

import SwiftUI

struct RootView: View {
  var body: some View {
    List(lessons, id: \.self) {
      Text("\($0)")
    }
    .safeAreaInset(edge: .top) { layoutGuide }
    .safeAreaInset(edge: .bottom) { layoutGuide }
  }
  
  var layoutGuide: some View {
      Text("")
        .frame(maxWidth: .infinity)
        .background(Color(uiColor: .systemGroupedBackground))
  }
  
}

struct ContentView_Previews: PreviewProvider {
  static var previews: some View {
    RootView()
  }
}

var lessons: [String] = [
  "Lesson.1",
  "Lesson.2",
  "Lesson.3",
  "Lesson.1",
  "Lesson.2",
  "Lesson.3",
  "Lesson.1",
  "Lesson.2",
  "Lesson.3",
  "Lesson.1",
  "Lesson.2",
  "Lesson.3",
  "Lesson.1",
  "Lesson.2",
  "Lesson.3",
  "Lesson.1",
  "Lesson.2",
  "Lesson.3",
  "Lesson.1",
  "Lesson.2",
  "Lesson.3",
  "Lesson.1",
  "Lesson.2",
  "Lesson.3",
]
