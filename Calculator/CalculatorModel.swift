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
  let objectWillChange = PassthroughSubject<Void, Never>()
  var brain: CalculatorBrain = .left("0") {
    willSet { objectWillChange.send() }
  }
}
