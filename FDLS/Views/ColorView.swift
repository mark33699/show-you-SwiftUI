//
//  ColorView.swift
//  FDLS
//
//  Created by Mark HsieH on 2022/9/19.
//

import SwiftUI

struct ColorModel: Hashable {
  let name: String
  let color: Color
}

struct ColorView: View {
  
  let colors: [Color] = [
    .red, .orange, .yellow, .green, .blue, 
  ]

  var colorModels: [ColorModel] {
    colors.map { ColorModel(name: "\($0)", color: $0) }
  }

  var body: some View {
    HStack(spacing: 0) {
      ForEach(colorModels, id: \.self) { colorModel in
        VStack {
          Text("\(colorModel.name)")
          colorModel.color
        }
      }
    }
  }
}

struct ColorView_Previews: PreviewProvider {
  static var previews: some View {
    ColorView()
  }
}
