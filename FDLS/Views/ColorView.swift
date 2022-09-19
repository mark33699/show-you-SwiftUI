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
  let mainColors: [Color] = [
    .red, .orange, .yellow, .green, .blue, .purple, .pink
  ]
  let iOS15Colors: [Color] = [
    .cyan, .teal, .mint, .indigo, .brown
  ]
  let dColors: [Color] = [
    .primary, .secondary
  ]

  var body: some View {
    VStack {
      HStack(spacing: 0) {
        ForEach(mainColors.toColorModel(), id: \.self) { colorModel in
          VStack {
            Text("\(colorModel.name)")
            colorModel.color
          }
        }
      }
      
      let otherColors = iOS15Colors + dColors
      HStack(spacing: 0) {
        ForEach(otherColors.toColorModel(), id: \.self) { colorModel in
          VStack {
            Text("\(colorModel.name)").font(.system(size: 11))
            colorModel.color
          }
        }
      }
      
      GroupBox("UIColor") {
        Color(UIColor.magenta) // 1.0, 0.0, 1.0 RGB
        Color(UIColor.tintColor)
      }
      
      GroupBox("Color Asset") {
        Color("flutter")
      }
        
      GroupBox("Color Extension") {
        Color(0x2196F3, opacity: 0.5)
        Color(0x802196F3) // https://gist.github.com/lopspower/03fb1cc0ac9f32ef38f4
        Color(red: 30, green: 150, blue: 243, opacity: 0.5)
      }
          
      GroupBox("Color by ColorSpace") {
        Color(.sRGB, red: 0.5, green: 0.5, blue: 0.5, opacity: 1) //default
        Color(.sRGBLinear, red: 0.5, green: 0.5, blue: 0.5, opacity: 1)
        Color(.displayP3, red: 0.5, green: 0.5, blue: 0.5, opacity: 1)
      }
      
      
    }
  }
}

struct ColorView_Previews: PreviewProvider {
  static var previews: some View {
    ColorView()
  }
}

extension Array where Element == Color {
  func toColorModel() -> [ColorModel] {
    self.map { ColorModel(name: "\($0)", color: $0) }
  }
}

extension Color {
  init(_ hex: UInt, opacity: Double) {
    self.init(
      .sRGB,
      red: Double((hex >> 16) & 0xFF) / 255,
      green: Double((hex >> 8) & 0xFF) / 255,
      blue: Double(hex & 0xFF) / 255,
      opacity: opacity
    )
  }
  
  init(_ hex: UInt) {
    self.init(
      .sRGB,
      red: Double((hex >> 16) & 0xFF) / 255,
      green: Double((hex >> 8) & 0xFF) / 255,
      blue: Double(hex & 0xFF) / 255,
      opacity: Double((hex >> 24) & 0xFF) / 255
    )
  }
  
  init(red: Int, green: Int, blue: Int, opacity: Double = 1) {
    self.init(
      .sRGB,
      red: Double(red) / 255,
      green: Double(green) / 255,
      blue: Double(blue) / 255,
      opacity: opacity
    )
  }
}
