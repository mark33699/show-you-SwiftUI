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
  
  func apply(_ item: CalculatorButtonItem) {
    brain = brain.apply(item: item)
    history.append(item)
  }
}
