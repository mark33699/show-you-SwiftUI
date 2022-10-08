//
//  StorageView.swift
//  FDLS
//
//  Created by FlyFat on 2022/10/9.
//

import SwiftUI

struct Storage {
  enum Key: String {
    case name
  }

  static let nameKey = Key.name.rawValue
}

struct StorageView: View {
  @AppStorage(Storage.nameKey) var name: String = ""

  var body: some View {
    ZStack {
      Color.gray
      TextField("what's your name?", text: $name)
        .textFieldStyle(.roundedBorder)
        .frame(width: UIScreen.main.bounds.width / 2)
    }
  }
}

struct StorageView_Previews: PreviewProvider {
  static var previews: some View {
    StorageView()
  }
}
