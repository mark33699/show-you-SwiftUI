//
//  ContentView.swift
//  FDLS
//
//  Created by Mark HsieH on 2022/8/17.
//

import SwiftUI

struct CalculatorView: View {
  var body: some View {
    
    VStack (spacing: 12) {
      
      Spacer()
      
      Text("3.14")
        .font(.system(size: 76))
        .minimumScaleFactor(0.5)
        .lineLimit(1)
        .frame(maxWidth: .infinity, alignment: .trailing)
        .padding(.trailing, 4)

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
    CalculatorView().preferredColorScheme(.dark)
    CalculatorView().previewDevice("iPhone SE (2nd generation)")
    CalculatorView().previewDevice("iPhone 13 Pro Max")
  }
}
