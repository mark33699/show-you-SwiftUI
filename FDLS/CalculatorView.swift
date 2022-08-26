//
//  ContentView.swift
//  FDLS
//
//  Created by Mark HsieH on 2022/8/17.
//

import SwiftUI

struct CalculatorView: View {
  
  let buttons: [CalculatorButtonItem] = [
    .digit(1), .digit(2), .digit(3), .op(.plus)
  ]
  
  var body: some View {
    ZStack {
//      Color.teal
      
      HStack {
        ForEach(buttons, id: \.self) { button in
          CalculatorButton(title: button.title, bgColorName: button.backgroundColorName)
        }
      }
      
    }
  }
}

struct ContentView_Previews: PreviewProvider {
  static var previews: some View {
    CalculatorView()
  }
}
