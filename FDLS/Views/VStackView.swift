//
//  VStackView.swift
//  FDLS
//
//  Created by Mark HsieH on 2022/9/3.
//

import SwiftUI

struct VStackView: View {
  
  var body: some View {
    
    VStack {
      Text("VStack default")
      VStack {
        Color.red
        Color.yellow
        Color.green
      }

      Text("VStack spacing is zero")
      VStack(spacing: 0) {
        Color.red
        Color.yellow
        Color.green
      }

      Text("VStack alignment is trailing")
      VStack(alignment: .trailing) {
        Color.red.frame(width: 100)
        Color.yellow.frame(width: 100)
        Color.green
      }

      Text("VStack alignment is still trailing") // why still be center...
      VStack(alignment: .trailing) {
        Color.red.frame(width: 100)
        Color.yellow.frame(width: 100)
        Color.green.frame(width: 100)
      }.frame(maxWidth: .infinity).border(.red)

      Text("VStack alignment trailing by HStack")
      HStack {
        Spacer()
        VStack() {
          Color.red.frame(width: 100)
          Color.yellow.frame(width: 100)
          Color.green.frame(width: 100)
        }
      }
    }
    .navigationTitle("Layout")
    .toolbar {
        ToolbarItemGroup(placement: .navigationBarTrailing) {
            NavigationLink(destination: ZStackView()) {
              Text("overlap")
            }
        }
    }
    
    
  }
}

struct StackView_Previews: PreviewProvider {
  static var previews: some View {
    VStackView()
  }
}
