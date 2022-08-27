//
//  CalculatorModel.swift
//  Calculator
//
//  Created by Mark HsieH on 2022/8/27.
//  Copyright © 2022 OneV's Den. All rights reserved.
//

import Foundation
import Combine

class CalculatorModel: ObservableObject {
  @Published var brain: CalculatorBrain = .left("0")
  @Published var history: [CalculatorButtonItem] = []
  
  var temporaryKept: [CalculatorButtonItem] = []
  
  var historyDetail: String {
      history.map { $0.description }.joined()
  }
  
  var totalCount: Int {
      history.count + temporaryKept.count
  }

  var slidingIndex: Float = 0 {
      didSet {
        keepHistory(upTo: Int(slidingIndex))
      }
  }
  
  func apply(_ item: CalculatorButtonItem) {
    brain = brain.apply(item: item)
    history.append(item)
    
    temporaryKept.removeAll()
    slidingIndex = Float(totalCount)
  }
  
  func keepHistory(upTo index: Int) {
      precondition(index <= totalCount, "Out of index.")

      let total = history + temporaryKept

      history = Array(total[..<index])
      temporaryKept = Array(total[index...])

      brain = history.reduce(CalculatorBrain.left("0")) {
          result, item in
          result.apply(item: item)
      }
  }
  
}
