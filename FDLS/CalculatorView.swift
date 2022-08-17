//
//  ContentView.swift
//  FDLS
//
//  Created by Mark HsieH on 2022/8/17.
//

import SwiftUI

struct CalculatorView: View {
  var body: some View {
    HStack {
      CalculatorButton(title: "1", bgColorName: digitColorName)

      CalculatorButton(title: "2", bgColorName: digitColorName)

      CalculatorButton(title: "3", bgColorName: digitColorName)

      CalculatorButton(title: "+", bgColorName: operatorColorName)
    }
  }
}

struct ContentView_Previews: PreviewProvider {
  static var previews: some View {
    CalculatorView()
  }
}
