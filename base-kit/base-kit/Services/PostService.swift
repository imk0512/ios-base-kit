//
//  PostService.swift
//  base-kit
//
//  Created by 緒方亮平 on 2023/11/05.
//


import Firebase

struct PostService {
  
  private static let postsCollection = Firestore.firestore().collection("posts")
  
  static func fetchFeedPosts() async throws -> [Post] {
    let snapshot =  try await postsCollection.getDocuments()
    var posts = try snapshot.documents.compactMap({ try $0.data(as: Post.self)})
    
    for i in 0 ..< posts.count {
      let post = posts[i]
      let ownerUid = post.ownerUid
      let postUser = try await UserService.fetchUser(withUid: ownerUid)
      posts[i].user = postUser
    }
    
    return posts
  }
  
  static func fetchUserPosts(uid: String) async throws -> [Post] {
    let snapshot = try await postsCollection.whereField("ownerIod", isEqualTo: uid).getDocuments()
    return try snapshot.documents.compactMap({ try $0.data(as: Post.self)})
  }
}
