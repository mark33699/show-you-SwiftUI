//
//  ButtonView.swift
//  FDLS
//
//  Created by Mark HsieH on 2022/8/30.
//

import SwiftUI

struct ButtonView: View {
  
  let skyImages = ["sun.max.fill", "moon.fill", "star.fill"]
  @State var skyCount = 0
  let trafficImages = ["car.fill", "ferry.fill", "airplane"]
  @State var trafficCount = 0
  let organImages = ["eyes.inverse", "ear.fill", "mouth.fill"]
  @State var organCount = 0
  
  var body: some View {
    
    VStack {
      
      Spacer()
      Group {
        HStack {
          Button("sky") {
            skyCount += 1
          }
          .frame(width: 100, height: 100).border(.red)
          
          Image(systemName: skyImages[skyCount % skyImages.count]).resizable()
            .foregroundStyle(.blue)
            .padding().padding()
            .frame(width: 100, height: 100).border(.red)
        }
        
        HStack {
          Button {
            trafficCount += 1
          } label: {
            Text("traffic")
              .frame(width: 100, height: 100).border(.red)
          }
          
          Image(systemName: trafficImages[trafficCount % trafficImages.count]).resizable()
            .foregroundStyle(.blue)
            .padding().padding()
            .frame(width: 100, height: 100).border(.red)
        }
        
        HStack {
          Text("organ")
            .foregroundColor(.blue)
            .frame(width: 100, height: 100).border(.red)
            .background(.white)
            .onTapGesture {
              organCount += 1
            }
          
          Image(systemName: organImages[organCount % organImages.count]).resizable()
            .aspectRatio(contentMode: .fit)
            .foregroundStyle(.blue)
            .padding().padding()
            .frame(width: 100, height: 100).border(.red)
        }
      }
      
      Spacer()
      Group {
        Button("BorderedButton") {}.buttonStyle(.bordered)
        Button("BorderedProminentButton") {}.buttonStyle(.borderedProminent)
        Button("CustomCapsuleButton") {}.buttonStyle(.capsule)
      }
      
      Spacer()
      Menu("More Button") {
        Button("Option A"){}
        Button("Option B"){}
        Button("Option C"){}
        Menu("More & More") {
          Button("Option X"){}
          Button("Option Y"){}
          Button("Option Z"){}
        }
      }
      
      Spacer()
    }
  }
  
  
}

struct CapsuleButtonStyle: ButtonStyle {
  func makeBody(configuration: Configuration) -> some View {
    configuration.label
      .padding().padding(.horizontal)
      .background(
        Capsule()
          .foregroundColor(configuration.isPressed ? .green.opacity(0.5) : .green)
      )
  }
}

extension ButtonStyle where Self == CapsuleButtonStyle {
  static var capsule: Self { Self() }
}

struct ButtonView_Previews: PreviewProvider {
  static var previews: some View {
    ButtonView()
  }
}
