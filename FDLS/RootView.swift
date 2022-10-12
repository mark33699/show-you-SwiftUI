//
//  ContentView.swift
//  FDLS
//
//  Created by Mark HsieH on 2022/8/17.
//

import SwiftUI

let kTabLessonName = "頁籤"

struct RootView: View {
  
  @State var isExpanded = true
  @State var isPresented = false
  
  var body: some View {
    NavigationView {
      List {
        DisclosureGroup("基本") {
          getSubList(from: 0, to: 2)
        }
        DisclosureGroup("顯示") {
          getSubList(from: 2, to: 4)
        }
        DisclosureGroup("交互") {
          getSubList(from: 4, to: 10)
        }
        DisclosureGroup("視覺") {
          getSubList(from: 10, to: 15)
        }
        DisclosureGroup("滑動") {
          getSubList(from: 15, to: 18)
        }
        DisclosureGroup("導航") {
          getSubList(from: 18, to: 21)
        }
        DisclosureGroup("其他", isExpanded: $isExpanded) {
          getSubList(from: 21, to: 25)
        }
      }
      .safeAreaInset(edge: .top) { layoutGuide }
      .safeAreaInset(edge: .bottom) { layoutGuide }
      .navigationBarTitleDisplayMode(.inline) // for next view
      .navigationBarHidden(true) // not on NavigationView
    }
    .sheet(isPresented: $isPresented) {
      if let tabLesson = lessons.filter{ $0.name == kTabLessonName }.first {
        tabLesson.view
      }
    }
  }

  var layoutGuide: some View {
    Text("")
      .frame(maxWidth: .infinity)
      .background(Color(uiColor: .systemGroupedBackground))
  }
  
  func getSubList(from: Int, to: Int) -> some View{
      ForEach(from..<to, id: \.self) { index in
        let lesson = lessons[index]
        let label = Text("\(lesson.name)")
        if lesson.name == kTabLessonName {
          Button {
            isPresented = true
          } label: { label }
        } else {
          NavigationLink {
            lesson.view
          } label: { label }
        }
        
      }
  }

}

struct RootView_Previews: PreviewProvider {
  static var previews: some View {
    RootView()
  }
}

struct Lesson {
  let name: String
  let view: AnyView
}

let lessons = [
  Lesson(name: "常用Modifier", view: AnyView(CommonView())), //3
  Lesson(name: "排列", view: AnyView(VStackView())), //4
  
  Lesson(name: "文字", view: AnyView(TextView())), //5
  Lesson(name: "圖片", view: AnyView(ImageView())), //6
  
  Lesson(name: "按鈕", view: AnyView(ButtonView())), //7
  Lesson(name: "文字輸入", view: AnyView(TextInputView())), //8
  Lesson(name: "挑選器", view: AnyView(PickerView())), //9
  Lesson(name: "日期挑選", view: AnyView(DatePickerView())), //10
  Lesson(name: "對話框", view: AnyView(AlertView())), //11
  Lesson(name: "其他控件", view: AnyView(OtherControlView())), //12
  
  Lesson(name: "顏色", view: AnyView(ColorView())), //13
  Lesson(name: "形狀", view: AnyView(ShapeView())), //14
  Lesson(name: "其他View", view: AnyView(OtherView())), //15
  Lesson(name: "佈局", view: AnyView(LayoutView())), //16
  Lesson(name: "圖片挑選", view: AnyView(ImagePickerView())), //17
  
  Lesson(name: "滾動", view: AnyView(ScrollableView())), //18
  Lesson(name: "列表", view: AnyView(ListView())), //19~21
  Lesson(name: "表格", view: AnyView(GridView())), //22
  
  Lesson(name: "切換頁面", view: AnyView(NaviView())), //23
  Lesson(name: kTabLessonName, view: AnyView(BottomNaviView())), //24
  Lesson(name: "滑頁", view: AnyView(SwipeTabView())), //25
  
  Lesson(name: "生命週期", view: AnyView(LifeCycleView())), //26
  Lesson(name: "本地儲存", view: AnyView(StorageView())), //26
  Lesson(name: "API", view: AnyView(ApiView())), //27
  Lesson(name: "環境變數", view: AnyView(EnvironmentView())), //29
  
]
