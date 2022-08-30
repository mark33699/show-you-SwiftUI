//
//  TextView.swift
//  FDLS
//
//  Created by Mark HsieH on 2022/8/30.
//

import SwiftUI

struct TextView: View {
    var body: some View {
      Text("This is a Text")
        .background(Color.teal)
    }
}

struct TextView_Previews: PreviewProvider {
    static var previews: some View {
        TextView()
    }
}
