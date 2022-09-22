//
//  ImagePickerView.swift
//  FDLS
//
//  Created by Mark HsieH on 2022/9/20.
//

import PhotosUI
import SwiftUI

enum PictureSource {
  case camera
  case image
  case album
  case photo
}

struct ImagePickerView: View {
  
  @State private var currentImage = Image("AppLaunch")
  @State private var selectedImage: UIImage?
  @State private var showingPicker = false
  @State private var showingDialog = false
  @State private var pictureSource: PictureSource = .camera
  
  var body: some View {
    
    let length = UIScreen.main.bounds.width - 32
    
    Button {
      showingDialog = true
    } label: {
      currentImage
        .resizable()
        .scaledToFill()
        .frame(width: length, height: length)
        .clipShape(Circle())
        .overlay(
          Circle()
            .strokeBorder(.black, lineWidth: 10)
        )
    }.confirmationDialog("選擇照片來源", isPresented: $showingDialog, actions: {
      Button("相機") {
        pictureSource = .camera
        showingPicker = true
      }
      Button("傳統選擇器：相片") {
        pictureSource = .image
        showingPicker = true
      }
      Button("傳統選擇器：相簿") {
        pictureSource = .album
        showingPicker = true
      }
      Button("摩登選擇器") {
        pictureSource = .photo
        showingPicker = true
      }
      
    }).sheet(isPresented: $showingPicker) {
      switch pictureSource {
      case .camera:
        ImagePicker(image: $selectedImage, sourceType: .camera)
      case .image:
        ImagePicker(image: $selectedImage, sourceType: .photoLibrary)
      case .album:
        ImagePicker(image: $selectedImage, sourceType: .savedPhotosAlbum)
      case .photo:
        PhotoPicker(image: $selectedImage)
      }
      
    }.onChange(of: selectedImage) { newValue in
      loadImage()
    }
    
    
  }
  
  func loadImage() {
    guard let selectedImage = selectedImage else { return }
    currentImage = Image(uiImage: selectedImage)
  }
  
}

struct ImagePickerView_Previews: PreviewProvider {
  static var previews: some View {
    ImagePickerView()
  }
}

struct PhotoPicker: UIViewControllerRepresentable { // 1
  @Binding var image: UIImage?
  
  func makeUIViewController(context: Context) -> PHPickerViewController { // 2
    print("makeUIViewController")
    var cfg = PHPickerConfiguration()
    cfg.filter = .images
    let photoPickerVC = PHPickerViewController(configuration: cfg)
    photoPickerVC.delegate = context.coordinator // 5
    return photoPickerVC
  }
  
  //while state changed
  func updateUIViewController(_ uiViewController: PHPickerViewController, context: Context) {
    print("updateUIViewController")
  }
  
  func makeCoordinator() -> Coordinator { // 4
    Coordinator(self)
  }
 
  class Coordinator: NSObject, PHPickerViewControllerDelegate { // 3
    let parent: PhotoPicker

    init(_ parent: PhotoPicker) {
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

struct ImagePicker: UIViewControllerRepresentable {
  
  @Binding var image: UIImage?
  var sourceType: UIImagePickerController.SourceType
  
  func makeUIViewController(context: Context) -> UIImagePickerController {
    print("sourceType: \(sourceType.rawValue)")
    let imagePickerVC = UIImagePickerController()
    imagePickerVC.sourceType = sourceType
    imagePickerVC.allowsEditing = true
    imagePickerVC.delegate = context.coordinator
    return imagePickerVC
  }
  
  func updateUIViewController(_ uiViewController: UIImagePickerController, context: Context) {}
  
  func makeCoordinator() -> Coordinator {
    Coordinator(self)
  }
 
  class Coordinator: NSObject, UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    let parent: ImagePicker

    init(_ parent: ImagePicker) {
      self.parent = parent
    }

    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
      picker.dismiss(animated: true)
      
      if let image = info[UIImagePickerController.InfoKey.editedImage] as? UIImage {
        parent.image = image
      }
      
    }
    
  }
  
}
