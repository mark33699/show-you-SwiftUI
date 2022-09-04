//
//  PickerView.swift
//  FDLS
//
//  Created by Mark HsieH on 2022/9/3.
//

import SwiftUI

struct PickerView: View {
  let 干支 = ["天干", "地支"]
  let 天干 = ["甲", "乙", "丙", "丁", "戊", "己", "庚", "辛", "壬", "癸"]
  let 地支 = ["子", "丑", "寅", "卯", "辰", "巳", "午", "未", "申", "酉", "戌", "亥"]
  
  let iOSUiWays = [
    "coding",
    "Xib",
    "SB",
    "SwiftUI",
    "Flutter"
  ]
  
  // Protocol 'PickerStyle' can only be used as a generic constraint because it has Self or associated type requirements
//  let pickerStyles: [PickerStyle] = [
//    DefaultPickerStyle(),
//    InlinePickerStyle(),
//    WheelPickerStyle(),
//    SegmentedPickerStyle(),
//    MenuPickerStyle(),
//  ]
  
  @State var selectedIndex = 0
  @State var sexagenaryIndex = 0
  @State var heavenlyStemIndex = 0
  @State var earthlyBranchIndex = 0
  
  var body: some View {
    ScrollView {
      VStack {
        
        GroupBox("Picker GroupBox") {
          buildPicker(name: "default", style: .automatic)
          buildPicker(name: "menu", style: .menu)
          buildPicker(name: "segmented", style: .segmented)
          buildPicker(name: "wheel", style: .wheel)
          buildPicker(name: "inline", style: .inline)
        }
        
        GroupBox("Multi Component Picker") {
          VStack {
            Text("2 Wheel")
              .padding()
              .frame(maxWidth: .infinity, alignment: .leading)
            
            HStack {
              Picker("", selection: $sexagenaryIndex) {
                ForEach(0 ..< 干支.count) { index in
                  Text("\(干支[index])")
                }
              }
              .pickerStyle(.wheel)
              .frame(width: 100, alignment: .center)
              .compositingGroup().clipped()
              
              Group {
                if 干支[sexagenaryIndex] == 干支.first {
                  Picker("", selection: $heavenlyStemIndex) {
                    ForEach(0 ..< 天干.count) { index in
                      Text("\(天干[index])")
                    }
                  }
                } else if 干支[sexagenaryIndex] == 干支.last {
                  Picker("", selection: $earthlyBranchIndex) {
                    ForEach(0 ..< 地支.count) { index in
                      Text("\(地支[index])")
                    }
                  }
                }
              }
              .pickerStyle(.wheel)
              .frame(width: 100, alignment: .center)
              .compositingGroup().clipped()
            }
            
          }.border(.red)
        }
      }
    }
  }
  
  func buildPicker<S: PickerStyle>(name: String, style: S) -> some View {
    VStack {
      Text("\(name)")
        .padding()
        .frame(maxWidth: .infinity, alignment: .leading)
      Picker("Piacker", selection: $selectedIndex) { // state is index
//        ❌
//        ForEach(iOSUiWays, id: \.self) {
//          Text($0) //so need use index
//        }
        
//        ✅
        ForEach(iOSUiWays.indices, id: \.self) {
          Text("\(iOSUiWays[$0])")
        }
        
      }.pickerStyle(style)
    }.border(.red)
  }
}

struct PickerView_Previews: PreviewProvider {
  static var previews: some View {
    PickerView()
  }
}
