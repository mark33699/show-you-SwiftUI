//
//  LabView.swift
//  FDLS
//
//  Created by Mark HsieH on 2022/9/22.
//

import SwiftUI

struct LabView: View {
    var body: some View {
      HStack {
        Spacer()
        ScrollView {
          ForEach(0..<100) {
            Text("\($0)")
          }
        }.padding(.vertical, 1)
      }
    }
}

struct LabView_Previews: PreviewProvider {
    static var previews: some View {
      LabView()
    }
}
