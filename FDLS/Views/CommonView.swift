//
//  CommonView.swift
//  FDLS
//
//  Created by Mark HsieH on 2022/8/31.
//

import SwiftUI

struct CommonView: View {
  
  init() {
    UITableView.appearance().showsVerticalScrollIndicator = false
  }

  var body: some View {
    List {
      buildCell(desc: "Normal View", view: AnyView(
        Color.teal
      ))
      buildCell(desc: "View with padding", view: AnyView(
        Color.teal.padding()
      ))
      buildCell(desc: "View with frame & alignment", view: AnyView(
        Color.teal
          .frame(width: 10, height: 10)
          .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .bottomTrailing)
      ))
      buildCell(desc: "View with offset", view: AnyView(
        Color.teal.offset(x: 10, y: 10)
      ))
      buildCell(desc: "View with foregroundColor", view: AnyView(
        Rectangle().foregroundColor(.pink)
      ))
      buildCell(desc: "View with background", view: AnyView(
        Color.teal.padding().background(.pink)
      ))
      buildCell(desc: "View with border", view: AnyView(
        Color.teal.border(.pink, width: 4)
      ), isLast: true)
    }
    .environment(\.defaultMinListRowHeight, 10)
    .navigationTitle("Common")
  }

  func buildCell(desc: String, view: AnyView, isLast: Bool = false) -> some View {
    let halfWidth = UIScreen.main.bounds.width / 2 - 20
    return VStack(alignment: .leading, spacing: 0) {
      HStack(spacing: 0) {
        Text(desc)
          .padding(.leading, 10)
          .frame(width: halfWidth, alignment: .leading)
        view
      }.frame(height: 100)

      Divider()
        .frame(height: isLast ? 0 : 2)
        .background(Color.blue)
    }
    .listRowInsets(EdgeInsets())
    .listRowSeparator(.hidden)
  }
}

struct CommonView_Previews: PreviewProvider {
  static var previews: some View {
    CommonView()
  }
}
