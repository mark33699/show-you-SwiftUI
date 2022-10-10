//
//  MultiplatformView.swift
//  FDLS
//
//  Created by FlyFat on 2022/10/8.
//

import SwiftUI

struct MultiplatformView: View {
  
  @State var isShowAlert = false
  
  var body: some View {
    ZStack {
      #if os(macOS)
      Color.red
      #else
      Color.green
      #endif
      Text("Hello, Multiplatform!")
        .padding()
        .onTapGesture {
          isShowAlert  = true
        }
        .alert(isPresented: $isShowAlert) {
          Alert(title: Text("Hello"))
        }
    }
  }
}

struct MultiplatformView_Previews: PreviewProvider {
  static var previews: some View {
    MultiplatformView()
  }
}
