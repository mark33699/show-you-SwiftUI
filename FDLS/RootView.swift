//
//  ContentView.swift
//  FDLS
//
//  Created by Mark HsieH on 2022/8/17.
//

import SwiftUI

struct RootView: View {
  
  var body: some View {
    
    NavigationView {
      List(lessons.indices, id: \.self) { index in
          NavigationLink {
            getView(index: index)
          } label: {
            //Text("\($0)") //應該是無法跨view builder
            Text("\(lessons[index])")
          }
      }
      .safeAreaInset(edge: .top) { layoutGuide }
      .safeAreaInset(edge: .bottom) { layoutGuide }
      .navigationBarTitleDisplayMode(.inline) //for next view
      .navigationBarHidden(true) //not on NavigationView
    }
    
  }
  
  var layoutGuide: some View {
      Text("")
        .frame(maxWidth: .infinity)
        .background(Color(uiColor: .systemGroupedBackground))
  }
  
  func getView(index: Int) -> some View {
    Group{
        switch index {
          case 0: TextView()
          case 1: ButtonView()
          default: Text("Coming Soon")
        }
    }
  }
  
}

struct ContentView_Previews: PreviewProvider {
  static var previews: some View {
    RootView()
  }
}

var lessons: [String] {
  var lessons = [String]()
  for i in 1...30 {
    lessons.append("lesson \(i)")
  }
  return lessons
}

struct Lesson {
  let name: String
}
