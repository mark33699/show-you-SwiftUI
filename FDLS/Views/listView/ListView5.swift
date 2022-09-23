//
//  ListView5.swift
//  FDLS
//
//  Created by Mark HsieH on 2022/9/23.
//

import SwiftUI

struct ListView5: View {
  
  @State var showingSayHi = false
  @State var isBookmarkList = Array(repeating: false, count: 9)
  
    var body: some View {
      
        List(listItems.indices, id: \.self) { index in
          listItems[index]
            .swipeActions(edge: .leading, allowsFullSwipe: false) {
              Button {
                showingSayHi = true
              } label: {
                Text("Say Hi")
              }
            }
            .swipeActions(edge: .trailing, allowsFullSwipe: true) {
              Button {
                isBookmarkList[index].toggle()
              } label: {
                let isBookmark = isBookmarkList[index]
                Image(systemName: isBookmark ? "bookmark.circle" : "bookmark") //why is fill style?
              }
            }
            .alert(isPresented: $showingSayHi) {
                Alert(title: Text("Hi"))
            }
        }
      
    }
}

struct ListView5_Previews: PreviewProvider {
    static var previews: some View {
        ListView5()
    }
}
