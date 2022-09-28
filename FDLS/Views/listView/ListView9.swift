//
//  ListView9.swift
//  FDLS
//
//  Created by Mark HsieH on 2022/9/23.
//

import SwiftUI

struct ListView9: View {
  @State var showAlertA = false
  @State var showAlertB = false

  var body: some View {
    NavigationView {
      List {
        
        //cell
        ZStack {
          
          Color.brown
            .onTapGesture {
              showAlertA = true
            }
          
          HStack {
            Text("GOGOGO")
            
            Spacer()
            
            Text("DOWNLOAD")
              .padding()
              .background(.gray)
              .onTapGesture {
                showAlertB = true
              }
            
          }
        }
        .frame(maxWidth: .infinity, minHeight: 100)
        .onTapGesture {}
        .listRowSeparator(.hidden)
        
      } //List
      .listStyle(.plain)
      .alert(isPresented: $showAlertA) {
        Alert(title: Text("A"))
      }
      
    } //Nav
    .alert(isPresented: $showAlertB) {
      Alert(title: Text("B"))
    }
    
    
  }
}

struct ListView9_Previews: PreviewProvider {
  static var previews: some View {
    ListView9()
  }
}
