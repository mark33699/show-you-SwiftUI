//
//  NaviView.swift
//  FDLS
//
//  Created by Mark HsieH on 2022/10/5.
//

import SwiftUI

struct PassItem: Identifiable {
    let id = UUID()
    var isTrue: Bool
}

struct NaviView: View {
  @State var isPresentSheet = false
  @State var isPresentCover = false
  @State var item = PassItem(isTrue: false)
  
  var body: some View {
    VStack(spacing: 50) {
      
      Link(destination: .init(string: "https://developer.apple.com/xcode/swiftui")!) {
        Text("Link").padding()
      }
      
      Divider()
      
      HStack {
        Toggle.init("", isOn: $item.isTrue).labelsHidden()
      }
      
      NavigationLink {
        TheView(item: $item, message: "Another View -> A", couldClose: false)
      } label: {
        Text("NavigationLink").padding()
      }
        
      Button {
        isPresentSheet = true
      } label: {
        Text(".sheet").padding()
      }
      .sheet(isPresented: $isPresentSheet) {
        TheView(item: $item, message: "Another View -> B", couldClose: false)
      }
        
      Button {
        isPresentCover = true
      } label: {
        Text(".fullScreenCover").padding()
      }
      .fullScreenCover(isPresented: $isPresentCover) {
        TheView(item: $item, message: "Another View -> C", couldClose: true)
      }
      
    }
  }
}

// ‾-_-‾-_-‾-_-‾-_-‾-_-‾-_-‾-_-‾-_-‾-_-‾-_-‾-_-‾

struct TheView: View {
  
//  @Environment(\.presentationMode) var presentation //deprecated
  @Environment(\.dismiss) var dismiss
  
  @Binding var item: PassItem
  let message: String
  let couldClose: Bool
  
  var body: some View {
    VStack {
      HStack {
        Button {
          dismiss()
        } label: {
          Image(systemName: "xmark")
            .opacity(couldClose ? 1 : 0)
        }
        .padding()
        
        Spacer()
      }
      Spacer()
      Toggle.init("", isOn: $item.isTrue).labelsHidden()
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
