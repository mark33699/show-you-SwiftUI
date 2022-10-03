//
//  LabView.swift
//  FDLS
//
//  Created by Mark HsieH on 2022/9/22.
//

import SwiftUI

struct LabView: View {
  
  @State var width = 125.0
  
    var body: some View {
      
      let isFull = false
      
      Text("foo")
        .frame(maxWidth: isFull ? .infinity : width)
        .background(.brown)
      
    }
}

struct LabView_Previews: PreviewProvider {
    static var previews: some View {
      LabView()
    }
}
