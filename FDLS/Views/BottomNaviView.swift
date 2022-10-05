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

struct BottomNaviView: View {
  
  let tabs = [
    TabModel(color: .red, name: "featured", imageName: "star"),
    TabModel(color: .orange, name: "bookmarks", imageName: "book"),
    TabModel(color: .yellow, name: "contacts", imageName: "person.crop.circle"),
    TabModel(color: .green, name: "recents", imageName: "clock"),
    TabModel(color: .blue, name: "search", imageName: "magnifyingglass"),
//    TabModel(color: .gray, name: "setting", imageName: "gearshape"),
  ]
  
  var body: some View {
    TabView {
      ForEach(tabs) { tab in
        tab.color
          .overlay(content: {
            Text(tab.title)
          })
          .tabItem {
            Image(systemName: tab.imageName)
            Text(tab.name)
          }
      }
    }
  }
  
  
}

struct BottomNaviView_Previews: PreviewProvider {
  static var previews: some View {
    BottomNaviView()
  }
}
