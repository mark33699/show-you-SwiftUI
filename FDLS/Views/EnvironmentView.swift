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
          Toggle("current page dark mode", isOn: $isCurrentPageDarkMode)
          Toggle("whole app dark mode", isOn: $isWholeAppDarkMode)
          Toggle("Emergency mode", isOn: $isEnableEmergencyMode)
          SubView()
        }
        .frame(width: 250)
        .foregroundColor( enableEmergency ? .red : .primary )
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
  var body: some View {
    Text("I am subView")
      .foregroundColor( enableEmergency ? .red : .primary )
  }
}

struct EnvironmentView_Previews: PreviewProvider {
  static var previews: some View {
    EnvironmentView()
  }
}
