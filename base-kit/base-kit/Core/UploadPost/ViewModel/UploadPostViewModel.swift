//
//  UploadPostViewModel.swift
//  base-kit
//
//  Created by 緒方亮平 on 2023/11/05.
//

import Foundation
import PhotosUI
import SwiftUI
import Firebase


@MainActor
class UploadPostViewModel: ObservableObject {
  
  @Published var selectedImage: PhotosPickerItem? {
    didSet { Task {
      await loadImage(fromItem: selectedImage)}
    }
  }
  @Published var postImage: Image?
  private var uiImage: UIImage?
  
  func loadImage(fromItem item: PhotosPickerItem?) async {
    guard let item = item else { return }
    
    guard let data = try? await item.loadTransferable(type: Data.self) else { return }
    guard let uiImage = UIImage(data: data) else { return }
    self.uiImage = uiImage
    self.postImage = Image(uiImage: uiImage)
    
  }
  
  func uploadPost(caption: String) async throws {
    guard let uid = Auth.auth().currentUser?.uid else { return print("Auth Error")}
    guard let uiImage = uiImage else { return print("ui image error")}
    
    let postRef = Firestore.firestore().collection("posts").document()
    
    guard let imageUrl = try await ImageUploader.uploadImage(image: uiImage) else { return print("image upload error")}
    let post = Post(id: postRef.documentID, ownerUid: uid, caption: caption, likes: 0, imageUrl: imageUrl, timestamp: Timestamp())
    
    guard let encodedPost = try? Firestore.Encoder().encode(post) else { return print("NG")}
    try await postRef.setData(encodedPost)
  }
}
