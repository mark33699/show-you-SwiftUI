//
//  ButtonView.swift
//  FDLS
//
//  Created by Mark HsieH on 2022/8/30.
//

import SwiftUI

struct ButtonView: View {
    var body: some View {
      
      Button {
        print("tap")
      } label: {
        Text("This is a Button")
          .padding().padding()
          .background(Color.yellow)
      }

    }
}

struct ButtonView_Previews: PreviewProvider {
    static var previews: some View {
        ButtonView()
    }
}
