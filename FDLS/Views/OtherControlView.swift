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
  @State var sliderValue = 50.0
  @State var sliderStepValue = 50.0
  @State var stepperValue = 50
  @State var selectedFeatures = ["Female", "AB"]
  
  var body: some View {
    VStack {
      ScrollView {
        VStack {
          
          GroupBox("Toggle GroupBox") {
            Toggle("Toggle", isOn: $isOn)
            Toggle("Toggle with spring animation", isOn: $isOn.animation(.spring()))
            HStack(spacing: 0) {
              Text("Toggle independent label")
              Toggle("", isOn: $isOn).frame(width: 40)
            }
          }
          
          GroupBox("Slider GroupBox") {
            Slider(value: $sliderValue, in: 0...100) {
              Text("Label")
            } minimumValueLabel: {
              Text("min")
            } maximumValueLabel: {
              Text("max")
            }

            
            VStack {
              Slider(value: $sliderStepValue, in: 0...10, step: 2)
              HStack {
                ForEach(0..<11) {
                  if $0 % 2 == 0 {
                    Text("\($0)")
                  } else {
                    Spacer()
                  }
                }
              }.padding(.horizontal, 4)
            }
          }
          
          GroupBox("Stepper GroupBox") {
            Stepper("value: \(stepperValue)", value: $stepperValue, in: 0...100, step: 2)

          }
          
          GroupBox("Context Menu GroupBox") {
            Text("Long Press")
              .padding()
              .contextMenu {
                Text("only display Text") //Text with system is not working
                Button { } label: {
                  Text("or Button")
                }
              }
          }
          
        }
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
      }.frame(height: 300)
    }
    
  }
  
  
}

struct OtherControlView_Previews: PreviewProvider {
  static var previews: some View {
    OtherControlView()
  }
}
