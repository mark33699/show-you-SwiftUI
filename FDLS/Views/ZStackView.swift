//
//  ZStackView.swift
//  FDLS
//
//  Created by FlyFat on 2022/9/9.
//

import SwiftUI

struct ZStackView: View {
  
  @State var isAlignmentTop = false
  
  var body: some View {
    let largeView = Color.green.frame(width: 90, height: 90)
    let mediumView = Color.yellow.frame(width: 60, height: 60)
    let samllView = Color.red.frame(width: 30, height: 30)

    VStack {
      Text("Three overlapped views by ZStack")
      ZStack {
        largeView
        mediumView
        samllView
      }
  
      Text("Three overlapped views by overlay")
      largeView
        .overlay(mediumView
          .overlay(samllView))
  
      HStack {
        Spacer().frame(width: 100)
        Toggle("Alignment top", isOn: $isAlignmentTop)
        Spacer().frame(width: 100)
      }
  
      if isAlignmentTop {
        Spacer()
      }
    }
  }
  
  
}

struct ZStackView_Previews: PreviewProvider {
  static var previews: some View {
    ZStackView()
  }
}
