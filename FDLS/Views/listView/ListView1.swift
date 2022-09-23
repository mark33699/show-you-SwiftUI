//
//  ListView1.swift
//  FDLS
//
//  Created by Mark HsieH on 2022/9/23.
//

import SwiftUI

struct ListView1: View {
    var body: some View {
      VStack {
        List {
          listItems[0]
          listItems[1]
          listItems[2]
          listItems[3]
          listItems[4]
          listItems[5]
          listItems[6]
          listItems[7]
          listItems[8]
        }
      }
    }
}

struct ListView1_Previews: PreviewProvider {
    static var previews: some View {
        ListView1()
    }
}
