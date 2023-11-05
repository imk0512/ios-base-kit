//
//  CurrentUserProfileView.swift
//  base-kit
//
//  Created by 緒方亮平 on 2023/11/05.
//

import SwiftUI

struct CurrentUserProfileView: View {
  
  let user: User

  var posts: [Post] {
    return Post.MOCK_POSTS.filter({ $0.user?.username == user.username })
  }
  
    var body: some View {
      NavigationStack {
        ScrollView {
          // header
          ProfileHeaderView(user: user)
          
          // post grid view
          PostGridView(posts: posts)
        }
        .navigationTitle("Profile")
        .navigationBarTitleDisplayMode(.inline)
        .toolbar {
          ToolbarItem(placement: .navigationBarTrailing) {
            Button {
              AuthService.shared.signout()
            } label: {
              Image(systemName: "line.3.horizontal")
                .foregroundColor(.black)
            }
          }
        }
      }
    }
}

struct CurrentUserProfileView_Previews: PreviewProvider {
    static var previews: some View {
      CurrentUserProfileView(user: User.MOC_USERS[0])
    }
}
