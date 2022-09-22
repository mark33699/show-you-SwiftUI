//
//  ImagePickerView.swift
//  FDLS
//
//  Created by Mark HsieH on 2022/9/20.
//

import PhotosUI
import SwiftUI

struct ImagePickerView: View {
  
  @State private var currentImahg = Image("AppLaunch")
  @State private var selectedImage: UIImage?
  @State private var showingImagePicker = false
  
  var body: some View {
    
    let length = UIScreen.main.bounds.width - 32
    
    Button {
      showingImagePicker = true
    } label: {
      currentImahg
        .resizable()
        .scaledToFill()
        .frame(width: length, height: length)
        .clipShape(Circle())
        .overlay(
          Circle()
            .strokeBorder(.black, lineWidth: 10)
        )
    }.sheet(isPresented: $showingImagePicker) {
      ImagePicker(image: $selectedImage)
    }.onChange(of: selectedImage) { newValue in
      loadImage()
    }
    
    
  }
  
  func loadImage() {
    guard let selectedImage = selectedImage else { return }
    currentImahg = Image(uiImage: selectedImage)
  }
  
}

struct ImagePickerView_Previews: PreviewProvider {
  static var previews: some View {
    ImagePickerView()
  }
}

struct ImagePicker: UIViewControllerRepresentable { // 1
  @Binding var image: UIImage?
  
  func makeUIViewController(context: Context) -> PHPickerViewController { // 2
    print("makeUIViewController")
    var cfg = PHPickerConfiguration()
    cfg.filter = .images
    let imagePickerVC = PHPickerViewController(configuration: cfg)
    imagePickerVC.delegate = context.coordinator // 5
    return imagePickerVC
  }
  
  func updateUIViewController(_ uiViewController: PHPickerViewController, context: Context) {
    print("updateUIViewController")
  }
  
  func makeCoordinator() -> Coordinator { // 4
    Coordinator(self)
  }
 
  class Coordinator: NSObject, PHPickerViewControllerDelegate { // 3
    let parent: ImagePicker

    init(_ parent: ImagePicker) {
      self.parent = parent
    }

    func picker(_ picker: PHPickerViewController, didFinishPicking results: [PHPickerResult]) {
      picker.dismiss(animated: true)

      guard let provider = results.first?.itemProvider else { return }

      if provider.canLoadObject(ofClass: UIImage.self) {
        provider.loadObject(ofClass: UIImage.self) { image, _ in
          self.parent.image = image as? UIImage
        }
      }
    }
  }
}
