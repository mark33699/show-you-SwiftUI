//
//  PickerView.swift
//  FDLS
//
//  Created by Mark HsieH on 2022/9/3.
//

import SwiftUI

struct PickerView: View {
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
  
  @State var isOn = true
  @State var selectedIndex = 0
  
  var body: some View {
    ScrollView {
      VStack {
        GroupBox("Toggle GroupBox") {
          Toggle("Toggle", isOn: $isOn)
          Toggle("Toggle with spring animation", isOn: $isOn.animation(.spring()))
          HStack(spacing: 0) {
            Text("Toggle independent")
            Toggle("", isOn: $isOn).frame(width: 40)
          }
        }
        
        GroupBox("Picker GroupBox") {
          buildPicker(name: "default", style: .automatic)
          buildPicker(name: "menu", style: .menu)
          buildPicker(name: "segmented", style: .segmented)
          buildPicker(name: "wheel", style: .wheel)
          buildPicker(name: "inline", style: .inline)
        }
      }
    }
  }
  
  func buildPicker<S: PickerStyle>(name: String, style: S) -> some View {
    VStack {
      Text("\(name)")
        .padding()
        .frame(maxWidth: .infinity, alignment: .leading)
      Picker("Piacker", selection: $selectedIndex) { //state is index
        
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
