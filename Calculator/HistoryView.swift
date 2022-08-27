//
//  HistoryView.swift
//  Calculator
//
//  Created by Mark HsieH on 2022/8/28.
//  Copyright © 2022 OneV's Den. All rights reserved.
//

import SwiftUI

struct HistoryView: View {
  @ObservedObject var model: CalculatorModel

  var body: some View {
    
      if model.history.count == 0 {
        Text("無紀錄")
      } else { //啊這段是要怎麼用Preview...
        VStack {
          Text("紀錄: \(model.historyDetail)")
          Text("顯示: \(model.brain.output)")
          Slider(
            value: $model.slidingIndex,
            in: 0 ... Float(model.totalCount ),
            step: 1
          )
        }.padding()
      }
    
  }
}

struct HistoryView_Previews: PreviewProvider {
  static var previews: some View {
    HistoryView(model: CalculatorModel())
  }
}
