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
    
    VStack {
      List {
        
        ButtonCell(showAlertA: $showAlertA, showAlertB: $showAlertB)
        
        ScrollCell()
        
      } //List
      .listStyle(.plain)
      .alert(isPresented: $showAlertA) {
        Alert(title: Text("A"))
      }
      
      Color.clear.frame(height: 1)
        .alert(isPresented: $showAlertB) {
          Alert(title: Text("B"))
        }
      
    }
    
    
  }
}

struct ListView9_Previews: PreviewProvider {
  static var previews: some View {
    ListView9()
  }
}

struct ButtonCell: View {
  
  @Binding var showAlertA: Bool
  @Binding var showAlertB: Bool
  
  var body: some View {
    ZStack {
      
      //ok
      Color.brown
        .onTapGesture {
          showAlertA = true
        }
      
      //ng
      //          Button {
      //            showAlertA = true
      //          } label: {
      //            Color.brown
      //          }
      
      //ng
      //          NavigationLink {
      //            Text("New Page")
      //          } label: {
      //            Color.brown
      //          }
      
      HStack {
        Text("GOGOGO").padding()
        
        Spacer()
        
        Text("DOWNLOAD")
          .padding()
          .background(.gray)
          .padding()
          .onTapGesture {
            showAlertB = true
          }
        
      }
    }
    .frame(maxWidth: .infinity, minHeight: 100)
    .onTapGesture {}
    .listRowSeparator(.hidden)
  }
}

struct ScrollCell: View {
  var body: some View {
    ScrollView(.horizontal, showsIndicators: false) {
      HStack(spacing: 0) {
        ForEach(0..<20) { index in
          NavigationLink {
            Text("New Page\(index+1)")
          } label: {
            Color(uiColor: .secondarySystemBackground)
              .frame(width: 160, height: 90)
              .clipShape(RoundedRectangle(cornerRadius: 8))
              .shadow(color: .black, radius: 2, x: 2, y: 2)
              .padding(.horizontal, 8)
              .padding(.vertical, 16)
              .overlay(Text("Card \(index+1)"))
          }
        }
      }
    }
    .padding(.horizontal, 8)
    .background(.brown)
    .listRowSeparator(.hidden)
  }
}
