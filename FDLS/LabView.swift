//
//  LabView.swift
//  FDLS
//
//  Created by Mark HsieH on 2022/9/22.
//

import SwiftUI

//https://designcode.io/swiftui-handbook-tabbar-to-root-view
struct LabView: View {
  @State private var tabSelection = 1
  @State private var tappedTwice: Bool = false

  @State private var home = UUID()
  @State private var courses = UUID()

  var body: some View {
    var handler: Binding<Int> { Binding(
      get: { self.tabSelection },
      set: {
        if $0 == self.tabSelection {
          // Lands here if user tapped more than once
          tappedTwice = true
        }
        self.tabSelection = $0
      }
    ) }

    return TabView(selection: handler) {
      
      //A
      NavigationView {
        Color.pink
          .id(home)
          .overlay {
            NavigationLink {
              NextView(color: .white, number: 1)
            } label: {
              Text("Next!").tint(.white)
            }.buttonStyle(.borderedProminent)
          }
          .onChange(of: tappedTwice, perform: { tappedTwice in
            guard tappedTwice else { return }
            home = UUID()
            self.tappedTwice = false
          })
      }
      .tabItem {
        Image(systemName: "square.grid.2x2.fill")
        Text("Learn Now")
      }
      .tag(1)

      //B
      NavigationView {
        Color.purple
          .id(courses)
          .overlay {
            NavigationLink {
              NextView(color: .white, number: 1)
            } label: {
              Text("Next!").tint(.white)
            }.buttonStyle(.borderedProminent)
          }
          .onChange(of: tappedTwice, perform: { tappedTwice in
            guard tappedTwice else { return }
            home = UUID()
            self.tappedTwice = false
          })
      }
      .tabItem {
        Image(systemName: "rectangle.stack.fill")
        Text("Courses")
      }
      .tag(2)
    }
  }
}

struct LabView_Previews: PreviewProvider {
  static var previews: some View {
    LabView()
  }
}
