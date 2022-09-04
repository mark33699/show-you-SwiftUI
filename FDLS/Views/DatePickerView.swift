//
//  PickerView2.swift
//  FDLS
//
//  Created by Mark HsieH on 2022/9/4.
//

import SwiftUI

enum DatePickerDisplay {
  case dateTime
  case date
  case time
}

struct DatePickerView: View {
  @State private var date = Date()
  
  var body: some View {
    ScrollView {
      VStack {
        
        GroupBox("Date&TimePicker GroupBox") {
          buildDatePicker(name: "default", style: .automatic)
          buildDatePicker(name: "compact", style: .compact)
          buildDatePicker(name: "compact without label", style: .compact, isLabelsHidden: true)
          buildDatePicker(name: "wheel", style: .wheel)
          buildDatePicker(name: "graphical", style: .graphical)
        }
        
        Divider().padding()
        GroupBox("DatePicker GroupBox") {
          buildDatePicker(name: "compact", style: .compact, display: .date)
          buildDatePicker(name: "wheel", style: .wheel, display: .date)
          buildDatePicker(name: "graphical", style: .graphical, display: .date)
        }
        
        Divider().padding()
        GroupBox("TimePicker GroupBox") {
          buildDatePicker(name: "compact", style: .compact, display: .time)
          buildDatePicker(name: "wheel", style: .wheel, display: .time)
        }
        
      }
    }
    
  }
  
  func buildDatePicker<S: DatePickerStyle>(
    name: String,
    style: S,
    isLabelsHidden: Bool = false,
    display: DatePickerDisplay = .dateTime
  ) -> some View {
      
    VStack {
      Text("\(name)")
        .padding()
        .frame(maxWidth: .infinity, alignment: .leading)
      
      HStack {
        Spacer().frame(width: 16)
        Group {
          let picker = DatePicker("DatePicker", selection: $date, displayedComponents: getComponents(display))
            .datePickerStyle(style)
          if isLabelsHidden {
            picker.labelsHidden()
          } else {
            picker
          }
        }
        Spacer().frame(width: 16)
      }
      
    }
    .border(.red)
    
  }
  
  func getComponents(_ display: DatePickerDisplay) -> DatePicker.Components {
    var components: DatePicker.Components = [.hourAndMinute, .date]
    if display == .date {
      components = [.date]
    } else if display == .time {
      components = [.hourAndMinute]
    }
    return components
  }


}

struct PickerView2_Previews: PreviewProvider {
  static var previews: some View {
    DatePickerView()
  }
}
