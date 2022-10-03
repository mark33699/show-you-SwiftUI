//
//  LabView.swift
//  FDLS
//
//  Created by Mark HsieH on 2022/9/22.
//

import SwiftUI

struct LabView: View {
  
  @State var opacityValue = 0.004167
  
    var body: some View {
      
      let isShow = false
      
      VStack {
        Color.pink
          .overlay(Text("\(opacityValue)"))
        
//        if isShow {
//          Color.pink
//        }
        
        Color.pink
          .onTapGesture {
            opacityValue -= 0.000001
          }
          .opacity(isShow ? 1 : opacityValue)
        
        Color.pink
      }
    }
}

struct LabView_Previews: PreviewProvider {
    static var previews: some View {
      LabView()
    }
}
