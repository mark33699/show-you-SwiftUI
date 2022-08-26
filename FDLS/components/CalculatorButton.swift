//
//  CalculatorButton.swift
//  FDLS
//
//  Created by Mark HsieH on 2022/8/18.
//

import SwiftUI

struct CalculatorButton: View {
  
  let title: String
//  let bgColor: View //Protocol 'View' can only be used as a generic constraint because it has Self or associated type requirements
  let bgColorName: String
  let size: CGSize
//  let action: (() -> Void)

  var body: some View {
    Button {
      print("按！\(title)")
    } label: {
      Text(title)
        .font(.system(size: 38))
        .foregroundColor(.white)
        .frame(width: size.width, height: size.height)
        .background(Color(bgColorName))
        .cornerRadius(size.height / 2)
    }
  }
}
