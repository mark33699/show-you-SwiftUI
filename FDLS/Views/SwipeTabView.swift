//
//  SwipeTabView.swift
//  FDLS
//
//  Created by Mark HsieH on 2022/10/7.
//

import SwiftUI

let maxBannerCount = 30000
let banners = [
    Color.blue,
    Color.mint,
    Color.cyan
]

struct SwipeTabView: View {
  @State var selectedPageIndex = 1
  @State var selectedBannerIndex = Int(maxBannerCount/2+1)
  
  var body: some View {
    VStack {
      
      Picker("", selection: $selectedPageIndex) {
        Text("red").tag(0)
        Text("yellow").tag(1)
        Text("green").tag(2)
      }
      .pickerStyle(.segmented)
      
      TabView(selection: $selectedPageIndex) {
        Color.red.tag(0)
        
        ZStack {
          
          Color.yellow
          
          TabView(selection: $selectedBannerIndex) {
            ForEach(0..<maxBannerCount) { index in
              banners[index % banners.count]
            }
          } //STabView
          .tabViewStyle(.page(indexDisplayMode: .never))
          .frame(width: 320, height: 180)
          .background(.purple)
          .overlay {
            PageControl(
              currentPage: CGFloat(selectedBannerIndex % banners.count),
              pageCount: banners.count,
              tintColor: .brown,
              normalColor: .white
            )
            .offset(y: 40)
            .scaleEffect(2)
          }
          
        } //ZStack
        .tag(1)
        
        Color.green.tag(2).overlay {
          Button {
            selectedPageIndex = 0
          } label: {
            Text("popToRoot")
          }
        }
        
      } //LTabView
      .animation(.easeInOut, value: selectedPageIndex)
      .tabViewStyle(.page(indexDisplayMode: .never))
      
    } //VStack
  }
}

//https://juejin.cn/post/7057024239076900894
struct PageControl: View {
  let currentPage: CGFloat
  let pageCount: Int
  let tintColor: Color
  let normalColor: Color

  var body: some View {
    HStack(alignment: .center, spacing: 6) {
      ForEach(0 ..< pageCount) { index in
        let floatIndex = CGFloat(index)
        let percent = 1 - (abs(floatIndex - currentPage) / 1)
        let fixedPercent = percent < 0 ? 0 : percent
        let width: CGFloat = abs(6 * fixedPercent) + 4
        ZStack {
          normalColor
          tintColor.opacity(fixedPercent)
        }
        .cornerRadius(2)
        .frame(width: width, height: 4)
      }
    }
  }
}

struct SwipeTabView_Previews: PreviewProvider {
  static var previews: some View {
    SwipeTabView()
  }
}
