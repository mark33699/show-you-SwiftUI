//
//  TextInputView.swift
//  FDLS
//
//  Created by FlyFat on 2022/9/11.
//

import SwiftUI

struct TextInputView: View {
  @State var input = ""
  @State var isShowAlert = false
  @FocusState var isFieldFocused: Bool
  @FocusState var isEditorFocused: Bool

  let bgColor = Color.mint

//  init() {
//    UITextField.appearance().backgroundColor = .clear //for rounded border style
//    UITextView.appearance().backgroundColor = .clear
//  }

  var body: some View {
    ZStack {
      bgColor.onTapGesture {
        print("Tap BG")
        isFieldFocused.toggle()
      }
      VStack {
        Spacer()
        Group {
          VStack(spacing: 0) {
            TextField("default style", text: $input)
              .onSubmit {
                isShowAlert = true
              }
              .focused($isFieldFocused)
              .alert(isPresented: $isShowAlert) {
                Alert(title: Text("sent"))
              }
            Divider()
          }

          TextField("plain style", text: $input)
            .textFieldStyle(.plain)

          TextField("rounded border style", text: $input)
            .textFieldStyle(.roundedBorder)
          // .border(.red) //not rounded

          Spacer().frame(height: 24)

          SecureField("secure field", text: $input)
        }

        TextEditor(text: $input)
          .frame(height: 100)
          .focused($isEditorFocused)
          .toolbar {
            ToolbarItemGroup(placement: .keyboard) {
//              if isEditorFocused { //add condition will never display
                Spacer() // even breakpoint stop here
                Button("Done") {
                  isEditorFocused = false
                }
//              }
            }
          }

      }.padding()
    }
  }
}

struct TextInputView_Previews: PreviewProvider {
  static var previews: some View {
    TextInputView()
  }
}
