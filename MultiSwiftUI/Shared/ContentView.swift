//
//  ContentView.swift
//  Shared
//
//  Created by FlyFat on 2022/10/8.
//

import SwiftUI

struct ContentView: View {
  @State private var isShowingAlert: Bool = false
  
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
          isShowingAlert  = true
        }
        .alert(isPresented: $isShowingAlert) {
          Alert(title: Text("Hello"))
        }
    }
  }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
