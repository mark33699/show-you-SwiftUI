//
//  TextView.swift
//  FDLS
//
//  Created by Mark HsieH on 2022/8/30.
//

import SwiftUI

struct TextView: View {
  var body: some View {
    VStack(alignment: .leading) {
      
      Spacer()
      Label("This a Label", systemImage: "iphone")
      
      Group {
        Spacer()
        Divider()
        Spacer()
      }

      Group {
        Text("This is a Text")
        Text("This is a italic Text")
          .italic()
        Text("This is a bold Text")
          .bold()
      }

      Group {
        Text("This is a Text with underline")
          .underline()
        Text(
          """
          This is a Text with line spacing
          This is a Text with line spacing
          """)
          .lineSpacing(10) // view modifier
        Text("This is a Text with strikethrough")
          .strikethrough()
        Text("This is a Text with baselineOffset")
          .baselineOffset(10).border(.red)
      }

      Group {
        Text("This is a Text with font Weight")
          .fontWeight(.black)
        Text("This is a Text with foreground color")
          .foregroundColor(.red)
        Text("This is a Text with font size")
          .font(.system(size: 24))
        Text("This is a Text with tracking")
          .tracking(2.7)
      }

      Group {
        Text("1234567890 👈 This is normal Digit")
        Text("1234567890 👈 This is monospaced Digit")
          .monospacedDigit() // iOS15
      }

      Text("This is a Text with line limit, This is a Text with line limit, This is a Text with line limit, This is a Text with line limit")
        .lineLimit(1) // view modifier
        .padding(.bottom, 10)

      Text("This\nis\na\nText\nwith\nmultiline\ntextnalignment")
        .multilineTextAlignment(.center) // view modifier

      Spacer()

    }.padding()
//      .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .top) //if need align top
//      .border(Color.red)
      .navigationTitle("Text")
  }
}

struct TextView_Previews: PreviewProvider {
  static var previews: some View {
    TextView()
  }
}
