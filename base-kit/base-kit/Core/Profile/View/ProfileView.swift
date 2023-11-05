//
//  ProfileView.swift
//  base-kit
//
//  Created by 緒方亮平 on 2023/11/04.
//

import SwiftUI

struct ProfileView: View {
  
  let user: User

  var posts: [Post] {
    return Post.MOCK_POSTS.filter({ $0.user?.username == user.username })
  }
  
    var body: some View {
        ScrollView {
          // header
          ProfileHeaderView(user: user)
          
          // post grid view
         PostGridView(posts: posts)
        }
        .navigationTitle("Profile")
        .navigationBarTitleDisplayMode(.inline)
    }
}

struct ProfileView_Previews: PreviewProvider {
    static var previews: some View {
      ProfileView(user: User.MOC_USERS[1])
    }
}
