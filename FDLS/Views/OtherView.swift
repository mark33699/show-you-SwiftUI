//
//  OtherView.swift
//  FDLS
//
//  Created by Mark HsieH on 2022/9/12.
//

import SwiftUI

struct OtherView: View {
  @State var selectedIndex = 0

  var body: some View {

    GroupBox{
      Color.primary
      Color.secondary
    }.groupBoxStyle(CustomGroupBoxStyle())
    
//    let image = Image("AppLaunch-1").resizable().frame(width: 30, height: 30)
//    GroupBox {
//      Button {
//        // action
//      } label: {
//        image
//      }
//
//      Label {
//        Text("lbl")
//      } icon: {
//        image
//      }
//
//      GroupBox {
//        Color.yellow
//      } label: {
//        image
//      }
//
//    } label: {
//      Label("Color", systemImage: "swift")
//    }
    
    
  }
}

struct OtherView_Previews: PreviewProvider {
  static var previews: some View {
    OtherView()
  }
}

struct CustomGroupBoxStyle: GroupBoxStyle {
  func makeBody(configuration: Configuration) -> some View {
    HStack(spacing: 0, content: {
      configuration.content
        .padding(2)
        .border(.blue)
    })
  }
}
