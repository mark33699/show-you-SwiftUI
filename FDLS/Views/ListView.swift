//
//  ListView.swift
//  FDLS
//
//  Created by Mark HsieH on 2022/9/23.
//

import SwiftUI

struct ListView: View {
  var body: some View {
    ScrollView {
      VStack {
        ForEach(navigationItems.indices, id: \.self) { index in
          let item = navigationItems[index]
          buildNavigationCell(item)
        }
      }
    }
  }

  func buildNavigationCell(_ item: NavigationItem) -> some View {
    NavigationLink {
      item.listView.navigationTitle(Text("\(item.title)"))
    } label: {
      HStack {
        Text("\(item.title)").foregroundColor(.primary)
        Spacer()
        Image(systemName: "chevron.right").foregroundColor(.primary)
      }
      .padding(.horizontal)
      .frame(maxWidth: .infinity, minHeight: 40, alignment: .leading)
      .background(Color(uiColor: item.color))
    }
  }
}

struct ListView_Previews: PreviewProvider {
  static var previews: some View {
    ListView()
  }
}

struct NavigationItem {
  let title: String
  let color: UIColor
  let listView: AnyView
}

let navigationItems = [
  NavigationItem(title: "List with static data", color: .systemRed, listView: AnyView(ListView1())),
  NavigationItem(title: "List with dynemic data", color: .systemOrange, listView: AnyView(ListView2())),
  NavigationItem(title: "List with section", color: .systemYellow, listView: AnyView(ListView3())),
  
  NavigationItem(title: "List with switch style", color: .systemMint, listView: AnyView(ListView4())),
  NavigationItem(title: "List with swipe action", color: .systemGreen, listView: AnyView(ListView5())),
  NavigationItem(title: "List with edit button", color: .systemCyan, listView: AnyView(ListView6())),
  
  NavigationItem(title: "List with selection", color: .systemBlue, listView: AnyView(ListView7())),
  NavigationItem(title: "List with search & refreash", color: .systemIndigo, listView: AnyView(ListView8())),
  NavigationItem(title: "List with customize cell", color: .systemPurple, listView: AnyView(ListView9())),
]

let listItems = [
  Image(systemName: "square.grid.3x3.topleft.filled"),
  Image(systemName: "square.grid.3x3.topmiddle.filled"),
  Image(systemName: "square.grid.3x3.topright.filled"),
  Image(systemName: "square.grid.3x3.middleright.filled"),
  Image(systemName: "square.grid.3x3.bottomright.filled"),
  Image(systemName: "square.grid.3x3.bottommiddle.filled"),
  Image(systemName: "square.grid.3x3.bottomleft.filled"),
  Image(systemName: "square.grid.3x3.middleleft.filled"),
  Image(systemName: "square.grid.3x3.middle.filled"),
]


