//
//  ContentView.swift
//  FDLS
//
//  Created by Mark HsieH on 2022/8/17.
//

import SwiftUI

struct CalculatorView: View {
  var body: some View {
    
    VStack {
      CalculatorButtonsRow(
        items: [.command(.clear), .command(.flip), .command(.percent), .op(.divide)])

      CalculatorButtonsRow(
        items: [.digit(7), .digit(8), .digit(9), .op(.multiply)])

      CalculatorButtonsRow(
        items: [.digit(4), .digit(5), .digit(6), .op(.minus)])

      CalculatorButtonsRow(
        items: [.digit(1), .digit(2), .digit(3), .op(.plus)])

      CalculatorButtonsRow(
        items: [.digit(0), .dot, .op(.equal)])
    }
    
  }
}

struct ContentView_Previews: PreviewProvider {
  static var previews: some View {
    CalculatorView()
  }
}
