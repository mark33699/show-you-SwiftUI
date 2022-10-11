//
//  FDLSApp.swift
//  FDLS
//
//  Created by Mark HsieH on 2022/8/17.
//

import SwiftUI

@main
struct FDLSApp: App {
  @Environment(\.scenePhase) var scenePhase
  @State var didEnterBackground = false
  init() {
    print("App init")
  }
  
  var body: some Scene {
    
    WindowGroup {
      
      //❌ always new rootView
//      if scenePhase == .active {
//        FDLSApp.rootView
//      } else {
//        Color.white
//      }
      
      //❌
//      RootView()
//        .blur(radius: scenePhase == .active ? 0 : 10)
      
      //✅
      ZStack {
        RootView()

        if scenePhase != .active && didEnterBackground == false {
          Color.white
            .ignoresSafeArea()
            .overlay {
              Text("🙈非禮勿視🙈")
                .font(.title)
            }
          
        }
      }
      
//      LabView()
    }
    .onChange(of: scenePhase) { newScenePhase in
      switch newScenePhase {
      case .background:
        print("ScenePhase: Background")
        didEnterBackground = true
      case .inactive:
        print("ScenePhase: Inactive")
      case .active:
        print("ScenePhase: Active")
      @unknown default: //Switch covers known cases, but 'ScenePhase' may have additional unknown values, possibly added in future versions
        print("ScenePhase: Unknown")
        didEnterBackground = false
      }
    }
    
  }
  
  
}
