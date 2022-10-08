//
//  MultiplatformView.swift
//  FDLS
//
//  Created by FlyFat on 2022/10/8.
//

import SwiftUI

struct MultiplatformView: View {
  var body: some View {
    ZStack {
      #if os(macOS)
      Color.red
      #else
      Color.green
      #endif
      Text("Hello, Multiplatform!")
        .padding()
    }
  }
}

struct MultiplatformView_Previews: PreviewProvider {
  static var previews: some View {
    MultiplatformView()
  }
}
