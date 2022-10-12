//
//  EnvironmentView.swift
//  FDLS
//
//  Created by Mark HsieH on 2022/10/12.
//

import SwiftUI

struct EnvironmentView: View {
  @Environment(\.colorScheme) var colorScheme: ColorScheme
  @State var currentPageDarkMode = false
  @State var wholeAppDarkMode = false

  var body: some View {
    ZStack {
      Color.brown
      
      VStack {
        Text("Now is \(colorScheme == .dark ? "dark" : "light") mode")
        Toggle("current page dark mode", isOn: $currentPageDarkMode)
          .frame(width: 250)
        Toggle("whole app dark mode", isOn: $wholeAppDarkMode)
          .frame(width: 250)
      }
      .colorScheme(currentPageDarkMode ? .dark : .light )
      .preferredColorScheme(wholeAppDarkMode ? .dark : .light)
    }
    .onChange(of: wholeAppDarkMode) { newValue in
      currentPageDarkMode = newValue
    }
    
    
    
  }
}

struct EnvironmentView_Previews: PreviewProvider {
  static var previews: some View {
    EnvironmentView()
  }
}
