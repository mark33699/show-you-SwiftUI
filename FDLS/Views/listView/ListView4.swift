//
//  ListView4.swift
//  FDLS
//
//  Created by Mark HsieH on 2022/9/23.
//

import SwiftUI

struct ListView4: View {
  
  // Protocol 'PickerStyle' can only be used as a generic constraint because it has Self or associated type requirements
  // 幹，又是這個，真的很廢，東卡西卡
//  @State var currentStyle: ListStyle = DefaultListStyle()
  @State var currentStyle: ListStyleType = .plain
  
  init() {
    UITableView.appearance().separatorInset = UIEdgeInsets.zero //not working @@
  }
  
  var body: some View {
    
    let list = List {
      Section("top") {
        listItems[0].listRowBackground(Color.red)
        listItems[1].listRowBackground(Color.yellow)
        listItems[2].listRowBackground(Color.green)
      }
      Section("middle") {
        listItems[7].listRowSeparatorTint(.red)
        listItems[8].listRowSeparatorTint(.yellow)
        listItems[3].listRowSeparatorTint(.green)
      }
      Section("Bottom") {
        listItems[6].listRowSeparator(.hidden)
        listItems[5].listRowSeparator(.hidden)
        listItems[4].listRowSeparator(.hidden)
      }
    }
    
    VStack {
      
      switch currentStyle {
        case .automatic:
          list.listStyle(.automatic)
        case .grouped:
          list.listStyle(.grouped)
        case .inset:
          list.listStyle(.inset)
        case .insetGrouped:
          list.listStyle(.insetGrouped)
        case .plain:
          list.listStyle(.plain)
        case .sidebar:
          list.listStyle(.sidebar)
      }
      
      Picker("", selection: $currentStyle) {
        ForEach(ListStyleType.allCases, id: \.self) { style in
            Button {
              currentStyle = style
            } label: {
              Text("\(style.rawValue)")
            }
        }

      }
      
      
    }
  }
  
  //Fuckkkkkk
  //Function declares an opaque return type, but the return statements in its body do not have matching underlying types
//  func getStyle() -> some ListStyle {
//    switch currentStyle {
//    case .automatic:
//      return DefaultListStyle()
//    case .bordered:
//      return DefaultListStyle()
//    case .carousel:
//      return DefaultListStyle()
//    case .elliptical:
//      return DefaultListStyle()
//    case .grouped:
//      return GroupedListStyle()
//    case .inset:
//      return InsetListStyle()
//    case .insetGrouped:
//      return DefaultListStyle()
//    case .plain:
//      return PlainListStyle()
//    case .sidebar:
//      return SidebarListStyle()
//    }
//  }
  
  
  
}

enum ListStyleType: String, CaseIterable {
  case automatic
  case grouped
  case inset
  case insetGrouped
  case plain
  case sidebar
}

struct ListView4_Previews: PreviewProvider {
  static var previews: some View {
    ListView4()
  }
}
