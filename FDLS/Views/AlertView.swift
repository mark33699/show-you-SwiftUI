//
//  AlertView.swift
//  FDLS
//
//  Created by Mark HsieH on 2022/9/5.
//

import SwiftUI

struct AlertView: View {
  
  @State private var isShowSampleAlert = false
  @State private var isShowCancelableAlert = false
  @State private var isShowCompleteAlert = false
  @State private var isShowConfirmationDialog = false

  var body: some View {
    VStack(spacing: 100) {
      Button { isShowSampleAlert = true }
      label: { Text("Show Me Sample Alert") }
        .alert(isPresented: $isShowSampleAlert) {
          Alert(title: Text("Sample"))
        }

      Button { isShowCancelableAlert = true }
        label: { Text("Show Me Cancelable Alert") }
        .alert(isPresented: $isShowCancelableAlert) {
          Alert(
            title: Text("Cancelable"),
            message: Text("Tell you some message"),
            dismissButton: .cancel { print("canceled") }
          )
        }

      Button { isShowCompleteAlert = true }
        label: { Text("Show Me Complete Alert") }
        .alert(isPresented: $isShowCompleteAlert) {
          Alert(
            title: Text("Complete"),
            message: Text("Tell you some message"),
            primaryButton: .default(Text("Try Again"), action: { // Must have
              print("try")
            }),
            secondaryButton: .destructive(Text("Delete"), action: { // Must have
              print("delete")
            })
//            ,dismissButton: .cancel() // No way, Extra argument 'dismissButton' in call
          )
        }

      Button { isShowConfirmationDialog = true }
        label: { Text("Show Me Confirmation Dialog") }
        .confirmationDialog("Dialog",
          isPresented: $isShowConfirmationDialog,
          titleVisibility: .visible,
          actions: {
            ForEach(1..<9) { index in
              Button("Option \(index)", action: {})
            }
            Button("Option 9", role: .destructive, action: {})
            Button("Cancel", role: .cancel) {
              isShowConfirmationDialog = false
            }
        }, message: {
          Text("Tell you some message")
        })
        
    }
    
  }
  
  
}

struct AlertView_Previews: PreviewProvider {
  static var previews: some View {
    AlertView()
  }
}
