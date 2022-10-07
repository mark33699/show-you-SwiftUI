//
//  LabView.swift
//  FDLS
//
//  Created by Mark HsieH on 2022/9/22.
//

import SwiftUI

struct LabView: View {
  
  @State var selectedPageIndex = 1
  
  private let dotAppearance = UIPageControl.appearance()
  
  var body: some View {
    
    VStack(spacing: 0.5) {
      ForEach(0..<1000) { _ in
        Divider().background(.black)
      }
    }
    
  }
}

struct LabView_Previews: PreviewProvider {
  static var previews: some View {
    LabView()
  }
}
