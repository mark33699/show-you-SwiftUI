//
//  GridView.swift
//  FDLS
//
//  Created by Mark HsieH on 2022/10/3.
//

import SwiftUI

struct GridView: View {
  var body: some View {
    ZStack {
      Color.red.ignoresSafeArea()

      VStack {
        let d = UIDevice.current.name
        let w = Int(UIScreen.main.bounds.width)
        Text("\(d) Screen Width: \(w)")

        ScrollView {
          LazyVGrid(
//            columns: [
//              GridItem(.fixed(70)),
//              GridItem(.fixed(70)),
//              GridItem(.fixed(70)),
//          ],
            
//            columns: [
//              GridItem(.adaptive(minimum: 200), spacing: 5, alignment: .leading), //水平間隔
//          ],
            
            columns: Array.init(repeating: GridItem(.flexible()), count: 3),
            
//            columns: Array.init(repeating: GridItem(.flexible(), alignment: .topLeading), count: 7),
            
//            columns: [
//              GridItem(.flexible(), alignment: .topLeading),
//              GridItem(.flexible(), alignment: .top),
//              GridItem(.flexible(), alignment: .topTrailing),
//            ],
            
          alignment: .leading, //只能控水平對齊 (但還是以item為主)
          spacing: 10, // 垂直間隔
          pinnedViews: [.sectionHeaders, .sectionFooters]) {
            ForEach(0..<10) { section in
              Section {
                let count = (section + 1) * 10
                ForEach(0..<count) { item in
                  Text("\(section)-\(item)")
                    .padding()
//                    .frame(maxWidth: .infinity)
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
        .padding(.vertical, 0.1)
      }
    } // fix over safe area
  }
}

struct GridView_Previews: PreviewProvider {
  static var previews: some View {
    GridView().previewDevice("iPhone 12 Pro")
    GridView().previewDevice("iPhone 11 Pro Max")
  }
}
