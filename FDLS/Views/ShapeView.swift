//
//  ShapeView.swift
//  FDLS
//
//  Created by Mark HsieH on 2022/9/19.
//

import SwiftUI

struct ShapeView: View {
  
  var body: some View {
    
    VStack {
      
      decorateShape(shape: Circle())
      decorateShape(shape: Ellipse())
      decorateShape(shape: Capsule())
      decorateShape(shape: Capsule(style: .continuous))
      decorateShape(shape: RoundedRectangle(cornerRadius: 20))
      decorateShape(shape: Rectangle())
    
    }
    
    
    
  }
  
  func decorateShape<S: Shape>(shape: S) -> some View {
    return shape
      .stroke(Color.red, lineWidth: 3)
      .background(shape.foregroundColor(.yellow))
      .frame(width: 160.0, height: 90.0)
  }
  
}

struct UIView_Previews: PreviewProvider {
  static var previews: some View {
    ShapeView()
  }
}
