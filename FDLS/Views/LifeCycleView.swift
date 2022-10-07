//
//  LifeCycleView.swift
//  FDLS
//
//  Created by Mark HsieH on 2022/10/8.
//

import SwiftUI

enum ViewLifeCycle {
  case `default`
  case `init`
  case appear
  case disappear
}

struct LifeCycleView: View {
  
  @State var lifeCycle: ViewLifeCycle = .default
  
  init() {
    lifeCycle = .`init`
  }
  
  var body: some View {
    Group {
      switch lifeCycle {
      case .`default`:
        Color.black
      case .`init`:
        Color.red
      case .appear:
        Color.green
      case .disappear:
        Color.blue
      }
      
    }
    .onAppear { //will
      lifeCycle = .appear
    }
    .onChange(of: lifeCycle) { newValue in
      print("LifeCycleView: \(newValue)")
    }
    .onDisappear { //did
      print("LifeCycleView: disappear")
      lifeCycle = .disappear
    }
    
    
  }
  
  
}

struct LifeCycleView_Previews: PreviewProvider {
    static var previews: some View {
        LifeCycleView()
    }
}
