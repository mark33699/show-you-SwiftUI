//
//  GridView.swift
//  FDLS
//
//  Created by Mark HsieH on 2022/10/3.
//

import SwiftUI

enum GridType: String, CaseIterable {
  case fixed
  case adaptive
  case flexible
}

enum GridVAlign: String, CaseIterable {
  case top
  case center
  case bottom
}

enum GridHAlign: String, CaseIterable {
  case leading
  case center
  case trailing
}

struct GridView: View {
  @State var gridType: GridType = .fixed
  @State var gridVAlign: GridVAlign = .center
  @State var gridHAlign: GridHAlign = .center
  @State var itemWidth = 125.0
  @State var columnCount = 1
  @State var isFullItem = false
  
  var body: some View {
    ZStack {
      VStack {
        Color.red.ignoresSafeArea()
        Color.white.ignoresSafeArea()
      }

      VStack {
        let d = UIDevice.current.name
        let w = Int(UIScreen.main.bounds.width)
        Text("\(d) Screen Width: \(w)")

        ScrollView {
          LazyVGrid(
            columns: getGridItems(),
            alignment: .leading, // 只能控水平對齊 (但還是以item為主)
            spacing: 10, // 垂直間隔
            pinnedViews: [.sectionHeaders, .sectionFooters])
          {
            ForEach(0..<10) { section in
              Section {
                let count = (section + 1) * 10
                ForEach(0..<count) { item in
                  Text("\(section)-\(item)")
                    .padding()
                    .frame(maxWidth: isFullItem ? .infinity : 75)
                    .background(Color(UIColor.systemMint))
                }
              } header: {
                Text("Header - \(section)")
                  .frame(maxWidth: .infinity, minHeight: 40)
                  .background(.orange)
              } footer: {
                Text("Footer - \(section)")
                  .frame(maxWidth: .infinity, minHeight: 40)
                  .background(.yellow)
              }
            }
          }
        }
        .background(.brown)
        .padding(.vertical, 0.1) // fix over safe area
        
        Group {
          Group {
            Picker("", selection: $gridType) {
              ForEach(GridType.allCases.indices, id: \.self) { idx in
                Text("\(GridType.allCases[idx].rawValue)")
                  .tag(GridType.allCases[idx]) // why only segmented style need tag???
              }
            }
            Picker("", selection: $gridVAlign) {
              ForEach(GridVAlign.allCases.indices, id: \.self) { idx in
                Text("\(GridVAlign.allCases[idx].rawValue)")
                  .tag(GridVAlign.allCases[idx])
              }
            }
            Picker("", selection: $gridHAlign) {
              ForEach(GridHAlign.allCases.indices, id: \.self) { idx in
                Text("\(GridHAlign.allCases[idx].rawValue)")
                  .tag(GridHAlign.allCases[idx])
              }
            }
          }
          .padding(.bottom, 8)
          .pickerStyle(.segmented)
          .colorMultiply(.gray)
        
          Slider(value: $itemWidth, in: 50 ... 200) {
            Text("fucking confus uesless label")
          } minimumValueLabel: {
            Text("50")
          } maximumValueLabel: {
            Text("200")
          }
        
          HStack {
            Spacer()
            Text("\(columnCount)")
            Stepper("", value: $columnCount, in: 1 ... 10).labelsHidden()
            Spacer()
            Toggle("", isOn: $isFullItem).labelsHidden()
            Spacer()
          }
        }.padding(.horizontal)
      } // VStack
    } // ZStack
  }
  
  private func getGridItems() -> [GridItem] {
    switch gridType {
    case .fixed:
      return Array(repeating: GridItem(.fixed(itemWidth), alignment: getAlignment()), count: columnCount)
    case .adaptive:
      return Array(repeating: GridItem(.adaptive(minimum: itemWidth), alignment: getAlignment()), count: columnCount)
    case .flexible:
      return Array(repeating: GridItem(.flexible(), alignment: getAlignment()), count: columnCount)
    }
  }
  
  func getAlignment() -> Alignment {
    switch (gridVAlign, gridHAlign) {
    case (.top, .leading): return .topLeading
    case (.top, .center): return .top
    case (.top, .trailing): return .topTrailing
      
    case (.center, .leading): return .leading
    case (.center, .center): return .center
    case (.center, .trailing): return .trailing
      
    case (.bottom, .leading): return .bottomLeading
    case (.bottom, .center): return .bottom
    case (.bottom, .trailing): return .bottomTrailing
    }
  }
}

struct GridView_Previews: PreviewProvider {
  static var previews: some View {
    GridView()
//    GridView().previewDevice("iPhone 12 Pro")
//    GridView().previewDevice("iPhone 11 Pro Max")
  }
}
