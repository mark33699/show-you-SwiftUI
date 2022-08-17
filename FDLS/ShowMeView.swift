//
//  ShowMeView.swift
//  FDLS
//
//  Created by Mark HsieH on 2022/8/18.
//

import SwiftUI

struct ShowMeView: View {
  var body: some View {
    VStack {
      Text("Hello, World!")
      Label("Hello, World!", systemImage: "flag.fill")
    }.font(.title)
  }
}

struct ShowMeView_Previews: PreviewProvider {
  static var previews: some View {
    ShowMeView()
  }
}
