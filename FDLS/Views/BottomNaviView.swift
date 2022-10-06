//
//  BottomNaviView.swift
//  FDLS
//
//  Created by Mark HsieH on 2022/10/5.
//

import SwiftUI

struct TabModel: Identifiable {
  let id = UUID()
  let color: Color
  let name: String
  let imageName: String
  var title: String {
    return "This is \(name) page"
  }
}

let tabs = [
  TabModel(color: .red, name: "featured", imageName: "star"),
  TabModel(color: .orange, name: "bookmarks", imageName: "book"),
  TabModel(color: .yellow, name: "contacts", imageName: "person.crop.circle"),
  TabModel(color: .green, name: "recents", imageName: "clock"),
  TabModel(color: .cyan, name: "search", imageName: "magnifyingglass"),
//    TabModel(color: .gray, name: "setting", imageName: "gearshape"),
]

struct BottomNaviView: View {
  
  @State private var uuids = Array(repeating: UUID(), count: tabs.count)
  @State private var tabSelectedIndex = 0
  @State private var isTappedTwice = false
  
  var body: some View {
    
    var handler: Binding<Int> { Binding (
        get: { self.tabSelectedIndex },
        set: {
            if $0 == self.tabSelectedIndex {
                isTappedTwice = true
            }
            self.tabSelectedIndex = $0
        }
    )}
    
    return TabView(selection: handler) { //explicit use 'return' to avoid declaration 'handler' error: Closure containing a declaration cannot be used with result builder 'ViewBuilder'
      
      ForEach(tabs.indices) { index in
        let tab = tabs[index]
        NavigationView {
          tab.color
            .id(uuids[index])
            .navigationTitle(Text(tab.name.uppercased()))
            .overlay {
              VStack {
                Text(tab.title)
                NavigationLink {
                  NextView(color: tab.color.opacity(0.5), number: 1)
                } label: {
                  Text("Next!").tint(.white)
                }.buttonStyle(.borderedProminent)
              }
            }
            .onChange(of: isTappedTwice, perform: { isTappedTwice in
              guard isTappedTwice else { return }
              uuids[index] = UUID()
              self.isTappedTwice = false
            })
        }
        .tabItem {
          Label(tab.name, systemImage: tab.imageName)
        }
        .tag(index)
      } //ForEach
      
    } //TabView
    .onChange(of: tabSelectedIndex) { newValue in
      print("tab \(newValue) selected")
    }
    
    
  } //Body
  
  
  
}

struct BottomNaviView_Previews: PreviewProvider {
  static var previews: some View {
    BottomNaviView()
  }
}

struct NextView: View {
  let color: Color
  let number: Int
  var body: some View {
    color.overlay {
      VStack {
        Text("This is Next Number \(number)")
        NavigationLink {
          NextView(color: color.opacity(0.5), number: number + 1)
        } label: {
          Text("Next!").padding()
        }
      }
    }
  }
}
