//
//  StackView.swift
//  FDLS
//
//  Created by Mark HsieH on 2022/9/3.
//

import SwiftUI

struct StackView: View {
  
    var body: some View {
      
//      ZStack {
//        Color.green.frame(width: 300, height: 300)
//        Color.yellow.frame(width: 200, height: 200)
//        Color.red.frame(width: 100, height: 100)
//      }
      
//      VStack{
//        Text("Stack alignment default is center")
//        Text("center...")
//        Text("center...")
//      }
//
//      VStack{
//        Text("Stack alignment top")
//        Text("1. add Spacer()")
//        Text("2. set stack maxHeight(or maxWidth) infinity")
//        Spacer()
//      }.frame(maxHeight: .infinity)
      
      VStack {
        Text("VStack default")
        VStack {
          Color.red
          Color.yellow
          Color.green
        }
        
        Text("VStack spacing is zero")
        VStack(spacing: 0) {
          Color.red
          Color.yellow
          Color.green
        }
        
        Text("VStack alignment is trailing")
        VStack(alignment: .trailing) {
          Color.red.frame(width: 100)
          Color.yellow.frame(width: 100)
          Color.green
        }
        
        Text("VStack alignment is still trailing") //why be center...
        VStack(alignment: .trailing) {
          Color.red.frame(width: 100)
          Color.yellow.frame(width: 100)
          Color.green.frame(width: 100)
        }.frame(maxWidth: .infinity)
        
        Text("VStack alignment trailing by HStack") //workaround?...
        HStack {
          Spacer()
          VStack(alignment: .trailing) {
            Color.red.frame(width: 100)
            Color.yellow.frame(width: 100)
            Color.green.frame(width: 100)
          }
        }
        
      }
      
    }
  
  
  
}

struct StackView_Previews: PreviewProvider {
    static var previews: some View {
        StackView()
    }
}
