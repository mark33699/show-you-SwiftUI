//
//  ListView2.swift
//  FDLS
//
//  Created by Mark HsieH on 2022/9/23.
//

import SwiftUI

struct ListView2: View {
  var body: some View {
    List(listItems.indices, id: \.self) { index in
      listItems[index]
    }
  }
}

struct ListView2_Previews: PreviewProvider {
  static var previews: some View {
    ListView2()
  }
}
