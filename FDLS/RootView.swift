//
//  ContentView.swift
//  FDLS
//
//  Created by Mark HsieH on 2022/8/17.
//

import SwiftUI

struct RootView: View {
  var body: some View {
    NavigationView {
      List(lessons.indices, id: \.self) { index in
        let lesson = lessons[index]
        NavigationLink {
          lesson.view
        } label: {
          Text("\(lesson.name)")
        }
      }
      .safeAreaInset(edge: .top) { layoutGuide }
      .safeAreaInset(edge: .bottom) { layoutGuide }
      .navigationBarTitleDisplayMode(.inline) // for next view
      .navigationBarHidden(true) // not on NavigationView
    }
  }

  var layoutGuide: some View {
    Text("")
      .frame(maxWidth: .infinity)
      .background(Color(uiColor: .systemGroupedBackground))
  }

}

struct ContentView_Previews: PreviewProvider {
  static var previews: some View {
    RootView()
  }
}

struct Lesson {
  let name: String
  let view: AnyView
}

let lessons = [
  Lesson(name: "常用Modifier", view: AnyView(CommonView())),
  Lesson(name: "佈局", view: AnyView(VStackView())),
  Lesson(name: "顯示文字", view: AnyView(TextView())),
  Lesson(name: "顯示圖片", view: AnyView(ImageView())),
  Lesson(name: "按鈕", view: AnyView(ButtonView())),
  Lesson(name: "挑選器", view: AnyView(PickerView())),
  Lesson(name: "日期挑選", view: AnyView(DatePickerView())),
  Lesson(name: "圖片挑選", view: AnyView(EmptyView())),
  Lesson(name: "文字輸入", view: AnyView(TextInputView())),
  Lesson(name: "其他控件", view: AnyView(OtherControlView())),
  Lesson(name: "對話框", view: AnyView(AlertView())),
  Lesson(name: "顏色跟形狀", view: AnyView(EmptyView())),
]
