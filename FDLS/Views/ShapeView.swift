//
//  ShapeView.swift
//  FDLS
//
//  Created by Mark HsieH on 2022/9/19.
//

import SwiftUI

struct ShapeView: View {
  @State var blurValue = 0.0

  var body: some View {
    VStack {
      decorateShape(shape: Circle())
      decorateShape(shape: Ellipse())
      decorateShape(shape: Capsule())
      decorateShape(shape: Capsule(style: .continuous))
      decorateShape(shape: RoundedRectangle(cornerRadius: 20))
      decorateShape(shape: Rectangle())

      Slider(value: $blurValue, in: 0 ... 100, label: {}, minimumValueLabel: {
        Text("0")
      }, maximumValueLabel: {
        Text("100")
      })
      .padding([.trailing, .leading])

      Image(systemName: "swift")
        .resizable().foregroundColor(.orange).frame(width: 100, height: 100)
        .blur(radius: blurValue)
    }
  }

  func decorateShape<S: Shape>(shape: S) -> some View {
    var gradient: AnyView

    switch shape {
      case is Circle:
        let radial = RadialGradient(colors: [.red, .yellow, .green],
                                    center: .center,
                                    startRadius: 0,
                                    endRadius: 45)
        gradient = AnyView(radial)
      case is Ellipse, is Capsule:
        let angular = AngularGradient(colors: [.red, .green, .blue, .purple, .pink],
                                      center: .center,
                                      startAngle: .degrees(90),
                                      endAngle: .degrees(360))
        gradient = AnyView(angular)
      default:
        let line = LinearGradient(colors: [.red, .yellow],
                                  startPoint: .leading,
                                  endPoint: .trailing)
        gradient = AnyView(line)
    }

    return shape
      .stroke(Color.black, lineWidth: 3)
      .background(gradient.clipShape(shape))
      .frame(width: 160.0, height: 90.0)
  }
}

struct UIView_Previews: PreviewProvider {
  static var previews: some View {
    ShapeView()
  }
}
