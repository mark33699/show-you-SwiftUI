//
//  ListView3.swift
//  FDLS
//
//  Created by Mark HsieH on 2022/9/23.
//

import SwiftUI

struct ListView3: View {
    var body: some View {
      List {
        Section("top") {
          listItems[0]
          listItems[1]
          listItems[2]
        }
        Section("middle") {
          listItems[7]
          listItems[8]
          listItems[3]
        }
        Section("Bottom") {
          listItems[6]
          listItems[5]
          listItems[4]
        }
      }
    }
}

struct ListView3_Previews: PreviewProvider {
    static var previews: some View {
        ListView3()
    }
}
