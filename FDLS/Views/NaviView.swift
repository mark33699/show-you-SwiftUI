//
//  NaviView.swift
//  FDLS
//
//  Created by Mark HsieH on 2022/10/5.
//

import SwiftUI

struct NaviView: View {
  @State var isPresentSheet = false
  @State var isPresentCover = false
  
  var body: some View {
    VStack(spacing: 100) {
      NavigationLink {
        TheView(message: "Another View -> A")
      } label: {
        Text("NavigationLink").padding()
      }
        
      Button {
        isPresentSheet = true
      } label: {
        Text(".sheet").padding()
      }
      .sheet(isPresented: $isPresentSheet) {
        TheView(message: "Another View -> B")
      }
        
      Button {
        isPresentCover = true
      } label: {
        Text(".fullScreenCover").padding()
      }
      .fullScreenCover(isPresented: $isPresentCover) {
        TheView(message: "Another View -> C")
      }
    }
  }
}

// ‾-_-‾-_-‾-_-‾-_-‾-_-‾-_-‾-_-‾-_-‾-_-‾-_-‾-_-‾

struct TheView: View {
  
//  @Environment(\.presentationMode) var presentation //deprecated
  @Environment(\.dismiss) var dismiss
  
  var message: String
  
  var body: some View {
    VStack {
      HStack {
        Button {
          dismiss()
        } label: {
          Image(systemName: "xmark")
        }
        .padding()
        
        Spacer()
      }
      Spacer()
      Text(message)
      Spacer()
    }
  }
}

// ‾-_-‾-_-‾-_-‾-_-‾-_-‾-_-‾-_-‾-_-‾-_-‾-_-‾-_-‾

 struct NaviView_Previews: PreviewProvider {
    static var previews: some View {
        NaviView()
    }
 }

//struct TheView_Previews: PreviewProvider {
//  static var previews: some View {
//    TheView(message: "PREVIEW")
//  }
//}
