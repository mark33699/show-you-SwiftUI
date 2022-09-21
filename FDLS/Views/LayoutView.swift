//
//  LayoutView.swift
//  FDLS
//
//  Created by Mark HsieH on 2022/9/22.
//

import SwiftUI

enum ProxyFrameType {
  case local
  case parent
  case global
}

struct LayoutView: View {
  @State var currentProxyFrame: ProxyFrameType = .local
  @State var isFullScreen = false
  
  var coordinateSpace: CoordinateSpace {
    var coordinateSpace: CoordinateSpace = .local
    if currentProxyFrame == .parent {
      coordinateSpace = .named("parent")
    } else if currentProxyFrame == .global {
      coordinateSpace = .global
    }
    return coordinateSpace
  }
  
  var body: some View {
    ZStack {
      isFullScreen //Result values in '? :' expression have mismatching types 'some View' and 'Color'
        ? AnyView(Color.brown.ignoresSafeArea())
        : AnyView(Color.brown)
      
      Color.white
      
      VStack {
        
        Spacer()
        Toggle("", isOn: $isFullScreen).labelsHidden().tint(.brown)
        
        GeometryReader { proxy in
          HStack(spacing: 0) {
            Color.primary.frame(width: proxy.size.width / 3 * 2)
            Color.secondary
          }
        }
        
        HStack(spacing: 0) {
          Color.primary.frame(minWidth: 10)
          Color.secondary.layoutPriority(9999)
        }
          
        VStack { // parent
          Text(" I am Text") // target
            .frame(width: 200, height: 100)
            .background(
              GeometryReader { proxy in
                
                let minX = Int(proxy.frame(in: coordinateSpace).minX)
                let minY = Int(proxy.frame(in: coordinateSpace).minY)
                let maxX = Int(proxy.frame(in: coordinateSpace).maxX)
                let maxY = Int(proxy.frame(in: coordinateSpace).maxY)
                      
                VStack(alignment: .leading) {
                  Text("(x: \(minX), y: \(minY))")
                    .background(Color.yellow)
                  Spacer()
                  Text("(x: \(maxX), y: \(maxY))")
                    .background(Color.yellow)
                    .frame(maxWidth: .infinity, alignment: .trailing)
                }
              }
              .background(Color.white.opacity(0.5))
            )
            .background(.red)
        }
        .frame(width: 300, height: 300)
        .background(Color.blue)
        .coordinateSpace(name: "parent") // 錨點
        
        Picker("123", selection: $currentProxyFrame) {
          Text("自身").tag(ProxyFrameType.local)
          Text("父層").tag(ProxyFrameType.parent)
          Text("螢幕").tag(ProxyFrameType.global)
        }.pickerStyle(.segmented)
      }
      
      EmptyView().frame(height: 100).background(.red)
      
    }
  }
  
  
}

struct LayoutView_Previews: PreviewProvider {
  static var previews: some View {
    LayoutView()
  }
}
