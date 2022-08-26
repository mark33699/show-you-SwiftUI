//
//  CalculatorButtonItem.swift
//  FDLS
//
//  Created by Mark HsieH on 2022/8/26.
//

import UIKit

enum CalculatorButtonItem: Hashable {
  enum Operator: String {
    case plus = "+"
    case minus = "-"
    case divide = "÷"
    case multiply = "×"
    case equal = "="
  }

  enum Command: String {
    case clear = "AC"
    case flip = "+/-"
    case percent = "%"
  }

  case digit(Int)
  case dot
  case op(Operator)
  case command(Command)
}

extension CalculatorButtonItem {
  var title: String {
    switch self {
      case .digit(let value): return String(value)
      case .dot: return "."
      case .op(let op): return op.rawValue
      case .command(let command): return command.rawValue
    }
  }

  var backgroundColorName: String {
    switch self {
      case .digit, .dot: return digitColorName
      case .op: return operatorColorName
      case .command: return commandColorName
    }
  }

  var size: CGSize {
    if case .digit(let value) = self, value == 0 {
      return CGSize(width: 88 * 2 + 8, height: 88)
    }
    return CGSize(width: 88, height: 88)
  }
  
}
