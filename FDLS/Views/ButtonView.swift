//
//  ButtonView.swift
//  FDLS
//
//  Created by Mark HsieH on 2022/8/30.
//

import SwiftUI

struct ButtonView: View {
  var body: some View {
    VStack {
      Button {
        print("tap")
      } label: {
        Text("This is a Button")
          .padding().padding()
//            .background(Color.yellow) // out of safe area
//            .background(Color.yellow.frame(height: .infinity)) // why???
            .background(Color.yellow.edgesIgnoringSafeArea([])) //....負負得正
      }
      Spacer()
    }
  }
}

struct ButtonView_Previews: PreviewProvider {
  static var previews: some View {
    ButtonView()
  }
}
