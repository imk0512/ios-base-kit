//
//  FeedViewModel.swift
//  base-kit
//
//  Created by 緒方亮平 on 2023/11/05.
//

import Foundation
import Firebase

class FeedViewModel: ObservableObject {
  @Published var posts = [Post]()
  
  init() {
    Task { try await fetchPosts() }
  }
  
  @MainActor
  func fetchPosts() async throws{
    self.posts = try await PostService.fetchFeedPosts()
  }
}
