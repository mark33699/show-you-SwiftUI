//
//  OtherView.swift
//  FDLS
//
//  Created by Mark HsieH on 2022/9/12.
//

import SwiftUI

enum ProgressState {
  case ing
  case done
}

struct OtherView: View {
  let progressMaxValue = 10.0
  let timer = Timer.publish(every: 0.5, on: .main, in: .common).autoconnect()

  @State var progressState = ProgressState.ing
  @State var progressValue = 0.0 {
    didSet {
      progressState = progressValue == progressMaxValue ? .done : .ing
    }
  }

  var body: some View {

      VStack {

        Group { //Groups
          Group {
            Text("foo")
            Text("bar")
          }.background(.orange)

          GroupBox {
            Text("foo")
            Text("bar")
          }.background(.orange)

          GroupBox("Normal GroupBox") {
            Color.primary
            Color.secondary
          }

          GroupBox("Custom GroupBox") {
            Color.primary
            Color.secondary
          }.groupBoxStyle(CustomGroupBoxStyle())
          
          
          Divider().padding([.vertical])
          
        }

        Group { //Spacers
          HStack(spacing: 0) {
            Color.primary
            Spacer()
            Color.secondary
          }

          HStack(spacing: 0) {
            Color.primary
            Color.clear
            Color.secondary
          }

          HStack(spacing: 0) {
            Text("foo")
            Spacer()
            Text("bar")
          }
        }

        Group {

          ProgressView().scaleEffect(2.5).padding()

          ProgressView(value: progressValue, total: progressMaxValue) {
            Text("Download\(progressState == .ing ? "ing" : " finish!")")
          }
          .onReceive(timer) { timer in
            if progressValue < progressMaxValue {
              progressValue = min(progressMaxValue, progressValue + 1.0)
            } else if progressValue == progressMaxValue {
              progressValue = 0.0
            }
          }

          Color(uiColor: .secondarySystemBackground)
            .clipShape(RoundedRectangle(cornerRadius: 8))
            .shadow(color: .black, radius: 2, x: 2, y: 2)
            .overlay(Text("CardView"))
          
        }

      }.padding()

  }
}

struct OtherView_Previews: PreviewProvider {
  static var previews: some View {
    OtherView()
  }
}

struct CustomGroupBoxStyle: GroupBoxStyle {
  func makeBody(configuration: Configuration) -> some View {
    VStack {
      configuration.label.frame(width: .infinity)
      HStack(spacing: 0, content: {
        configuration.content
          .padding(2)
          .border(.blue)
      })
    }
  }
}
