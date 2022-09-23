//
//  ListView6.swift
//  FDLS
//
//  Created by Mark HsieH on 2022/9/23.
//

import SwiftUI

struct ListView6: View {
  @State var mutableListItems = listItems

  var body: some View {
    List {
      ForEach(mutableListItems.indices, id: \.self) { index in
        mutableListItems[index]
      }.onDelete { indexSet in
        mutableListItems.remove(atOffsets: indexSet)
      }.onMove { from, to in
        mutableListItems.move(fromOffsets: from, toOffset: to)
      }
    }
    .toolbar {
      ToolbarItem(placement: .navigationBarTrailing) {
        EditButton()
      }
    }
  }
}

struct ListView6_Previews: PreviewProvider {
  static var previews: some View {
    ListView6()
  }
}
