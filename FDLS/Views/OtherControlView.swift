//
//  OtherControlView.swift
//  FDLS
//
//  Created by Mark HsieH on 2022/9/5.
//

import SwiftUI

struct OtherControlView: View {
  
  let features = [
    ("gender", ["Male", "Female", "Non-binary", "Prefer not to disclose"]),
    ("blood type", ["A", "B", "AB", "O"])
  ]
  
  @State var isOn = true
  @State var selectedFeatures = ["Female", "AB"]
  
  var body: some View {
    VStack {
      
      GroupBox("Toggle GroupBox") {
        Toggle("Toggle", isOn: $isOn)
        Toggle("Toggle with spring animation", isOn: $isOn.animation(.spring()))
        HStack(spacing: 0) {
          Text("Toggle independent")
          Toggle("", isOn: $isOn).frame(width: 40)
        }
      }
      
      GroupBox("Slider GroupBox") {
        
      }
      
      GroupBox("Stepper GroupBox") {
        
      }
      
      GroupBox("Disclosure GroupBox") {
        List {
          DisclosureGroup("feature") {
            ForEach(features.indices, id: \.self) { featureIndex in
              let feature = features[featureIndex]
              DisclosureGroup(feature.0) {
                ForEach(feature.1, id: \.self) { text in
                  
                  Button {
                    print("\(text)")
                    selectedFeatures[featureIndex] = text
                  } label: {
                    HStack {
                      Text("\(text)")
                      Spacer()
                      if selectedFeatures.contains(text) {
                        Image(systemName: "checkmark")
                      }
                    }
                  }
                  
                }
              }
            }
          }
        }
      }
      
    }
    
  }
  
  
}

struct OtherControlView_Previews: PreviewProvider {
  static var previews: some View {
    OtherControlView()
  }
}
