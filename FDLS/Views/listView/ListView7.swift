//
//  ListView7.swift
//  FDLS
//
//  Created by Mark HsieH on 2022/9/23.
//

import SwiftUI

struct ListItemWithID: Identifiable {
  let id = UUID()
  let item: Image
}

struct ListView7: View {
  
  @State private var isMultiSelect = false
  @State private var singleSelection: UUID?
  @State private var multiSelection = Set<UUID>()
  
  let IdItems = listItems.map{ ListItemWithID(item: $0) }
  
    var body: some View {
      VStack {
        
        if isMultiSelect {
            List(IdItems, selection: $multiSelection) { $0.item }
        } else {
            List(IdItems, selection: $singleSelection) { $0.item }
        }
        
        HStack {
          Text("多選？")
          Toggle("", isOn: $isMultiSelect).labelsHidden()
        }.toolbar {
          EditButton()
        }
        
      }
    }
  
  
}

struct ListView7_Previews: PreviewProvider {
    static var previews: some View {
        ListView7()
    }
}
