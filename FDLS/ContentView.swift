//
//  ContentView.swift
//  FDLS
//
//  Created by Mark HsieH on 2022/8/17.
//

import SwiftUI

let operatorColor = Color("operatorBackground")

struct ContentView: View {
  var body: some View {
    Button {
      print("按！")
    } label: {
      Text("+")
        .font(.system(size: 38))
        .foregroundColor(.white)
        .frame(width: 88, height: 88)
        .background(operatorColor)
        .cornerRadius(44)
    }
  }
}

struct ContentView_Previews: PreviewProvider {
  static var previews: some View {
    ContentView()
  }
}
