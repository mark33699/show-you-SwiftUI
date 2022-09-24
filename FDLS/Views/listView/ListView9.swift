//
//  ListView9.swift
//  FDLS
//
//  Created by Mark HsieH on 2022/9/23.
//

import SwiftUI

struct ListView9: View {
  
  @State var showAlert = false
  
  var body: some View {
    NavigationView {
      
    List {
      NavigationLink {
        EmptyView()
      } label: {
        Text("GOGOGO")
      }
      
      
//      HStack {
//        Text("GOGOGO")
//        Spacer()
//
//        Text("DOWNLOAD")
//          .padding()
//          .background(.gray)
//          .onTapGesture {
//            showAlert = true
//          }
//
//      }
//      .frame(maxWidth: .infinity, minHeight: 100)
//      .background(.brown)
//      .onTapGesture {
//        showAlert = true
//      }

    }
    .animation(nil, value: UUID())
    .listStyle(.plain)
    .alert(isPresented: $showAlert) {
      Alert(title: Text("YES!"))
    }
      
    }
  }
}

struct ListView9_Previews: PreviewProvider {
  static var previews: some View {
    ListView9()
  }
}
