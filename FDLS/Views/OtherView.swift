//
//  OtherView.swift
//  FDLS
//
//  Created by Mark HsieH on 2022/9/12.
//

import SwiftUI

struct OtherView: View {
  @State var selectedIndex = 0
  
  var body: some View {
    Menu("More Button") {
      Button("Option A") {}
      Button("Option B") {}
      Button("Option C") {}
      Menu("More & More") {
        Button("Option X") {}
        Button("Option Y") {}
        Button("Option Z") {}
      }
    }
    
    Picker("Piacker", selection: $selectedIndex) {
      Button("Option A"){}
      Button("Option B"){}
      Button("Option C"){}
    }
      
    Text("Long Press")
      .padding()
      .contextMenu {
        Button("Option A") {}
        Button("Option B") {}
        Button("Option C") {}
      }
    
    
  }
}

struct OtherView_Previews: PreviewProvider {
  static var previews: some View {
    OtherView()
  }
}
