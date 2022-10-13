//
//  EnvironmentView.swift
//  FDLS
//
//  Created by Mark HsieH on 2022/10/12.
//

import SwiftUI

struct EnvironmentView: View {
  @Environment(\.colorScheme) var colorScheme: ColorScheme
  @Environment(\.enableEmergency) var enableEmergency: Bool
  @EnvironmentObject var emergencyObject: ReallyEmergencyMode
  
  @State var isCurrentPageDarkMode = false
  @State var isWholeAppDarkMode = false
  @State var isEnableEmergencyMode = false
  
  init() {
    isEnableEmergencyMode = enableEmergency // now is false
  }

  var body: some View {
    ZStack {
      Color.brown
      
      VStack {
        Group {
          Text("Now is \(colorScheme == .dark ? "dark" : "light") mode")
          Toggle("current page Dark mode", isOn: $isCurrentPageDarkMode)
          Toggle("whole app Dark mode", isOn: $isWholeAppDarkMode)
        }
        .frame(width: 250)
          
        Divider()
        
        Text("current view follow @Environment")
          .foregroundColor( enableEmergency ? .red : .primary )
        Text("current view follow @EnvironmentObject")
          .foregroundColor( emergencyObject.enable ? .red : .primary )
        Spacer().frame(height: 16)
        SubView()
        
        Group {
          Toggle("sublayer Emergency mode", isOn: $isEnableEmergencyMode)
          Toggle("whole app Emergency mode", isOn: $emergencyObject.enable)
        }
        .frame(width: 300)
      }
      .colorScheme(isCurrentPageDarkMode ? .dark : .light )
      .preferredColorScheme(isWholeAppDarkMode ? .dark : .light)
      .environment(\.enableEmergency, isEnableEmergencyMode)
    }
    .onAppear {
      isEnableEmergencyMode = enableEmergency //sync with Environment
    }
    .onChange(of: isWholeAppDarkMode) { newValue in
      isCurrentPageDarkMode = newValue
    }
    
    
    
  }
}

struct SubView: View {
  @Environment(\.enableEmergency) var enableEmergency: Bool
  @EnvironmentObject var emergencyObject: ReallyEmergencyMode
  
  var body: some View {
    Text("subView follow @Environment")
      .foregroundColor( enableEmergency ? .red : .primary )
    Text("subView follow @EnvironmentObject")
      .foregroundColor( emergencyObject.enable ? .red : .primary )
  }
}

struct EnvironmentView_Previews: PreviewProvider {
  static var previews: some View {
    EnvironmentView()
      .environmentObject(ReallyEmergencyMode(enable: true))
  }
}
