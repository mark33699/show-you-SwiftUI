//
//  CalculatorButtonItem.swift
//  FDLS
//
//  Created by Mark HsieH on 2022/8/26.
//

import Foundation

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
}
