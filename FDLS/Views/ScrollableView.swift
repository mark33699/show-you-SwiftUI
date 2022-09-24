//
//  ScrollableView.swift
//  FDLS
//
//  Created by FlyFat on 2022/9/25.
//

import SwiftUI

let count = 20

struct ScrollableView: View {
  
  @State var shouldShowsIndicators = true
  
  let content = ForEach(0 ..< count) { _ in
    Text("Hello, World!")
  }

  var body: some View {
    VStack {
      
      GroupBox {
        ScrollView(showsIndicators: shouldShowsIndicators) {
          content
        }.background(.gray)
      }
      .frame(maxHeight: .infinity)
      
      GroupBox {
        ScrollView(.horizontal, showsIndicators: shouldShowsIndicators) {
          HStack {
            content
          }
        }.background(.gray)
      }
      .frame(maxHeight: .infinity)
      
      GroupBox {
        ScrollView([.horizontal, .vertical], showsIndicators: shouldShowsIndicators) {
          ForEach(0 ..< count) { _ in
            HStack {
              content
            }
          }
        }.background(.gray)
      }
      .frame(maxHeight: .infinity)
      
    }.toolbar {
      Button(shouldShowsIndicators ? "Disable Scrollbar" : "Enable Scrollbar") {
        shouldShowsIndicators.toggle()
      }
    }
    
    
    
  }
}

struct ScrollableView_Previews: PreviewProvider {
  static var previews: some View {
    ScrollableView()
  }
}
