//
//  CalculatorButtonsRow.swift
//  FDLS
//
//  Created by Mark HsieH on 2022/8/26.
//

import SwiftUI

struct CalculatorButtonsRow: View {
  let items: [CalculatorButtonItem]
  var body: some View {
    HStack {
      ForEach(items, id: \.self) { item in
        CalculatorButton(
          title: item.title,
          bgColorName: item.backgroundColorName,
          size: item.size
        )
      }
    }
  }
}

struct CalculatorButtonsRow_Previews: PreviewProvider {
  static var previews: some View {
    CalculatorButtonsRow(items: [.digit(0)])
  }
}
