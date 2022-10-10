//
//  MacView.swift
//  FDLS-Mac
//
//  Created by FlyFat on 2022/10/8.
//

import SwiftUI

struct MacView: View {
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

struct MacView_Previews: PreviewProvider {
    static var previews: some View {
        MacView()
    }
}
