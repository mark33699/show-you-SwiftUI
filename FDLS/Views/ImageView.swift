//
//  ImageView.swift
//  FDLS
//
//  Created by Mark HsieH on 2022/9/8.
//

import SwiftUI

struct ImageView: View {
  var body: some View {
    let imageName = "PHP"
    let imageUrl = "https://effigis.com/wp-content/uploads/2015/02/DigitalGlobe_WorldView1_50cm_8bit_BW_DRA_Bangkok_Thailand_2009JAN06_8bits_sub_r_1.jpg"

    ScrollView {
      VStack {
        imageDivider("origin image")
        Image(imageName)
          .border(.red)

        Group {
          imageDivider("sized image")
          Image(imageName)
            .resizable()
            .frame(width: 200, height: 200)
            .border(.red)

          imageDivider("fit image")
          Image(imageName)
            .resizable().scaledToFit()
            .frame(width: 200, height: 200)
            .border(.red)

          imageDivider("fill image")
          Image(imageName)
            .resizable().scaledToFill()
            .frame(width: 200, height: 200)
            .border(.red)
          
          imageDivider("clipped image")
          Image(imageName)
            .resizable().scaledToFill()
            .frame(width: 200, height: 200)
            .clipped()
            .border(.red)

          imageDivider("circle image")
          Image(imageName)
            .resizable().scaledToFill()
            .frame(width: 200, height: 200)
            .clipShape(Circle())
            .border(.red)
        }

        imageDivider("system image")
        Image(systemName: "swift")
          .border(.red)

        imageDivider("async image")
        AsyncImage(url: .init(string: imageUrl)) { img in
          img.resizable().scaledToFit()
        } placeholder: {
          Color.gray.overlay {
            ProgressView()
          }
        }.scaledToFit()

        imageDivider()
      }
    }
  }

  func imageDivider(_ name: String = "") -> some View {
    VStack {
      Divider()
        .frame(height: 2)
        .background(.blue)
        .padding(.vertical)
      Text(name)
    }
  }
}

struct ImageView_Previews: PreviewProvider {
  static var previews: some View {
    ImageView()
  }
}
