//
//  FeedView.swift
//  base-kit
//
//  Created by 緒方亮平 on 2023/11/04.
//

import SwiftUI

struct FeedView: View {
    var body: some View {
      NavigationStack {
        ScrollView {
          LazyVStack(spacing: 32) {
            ForEach(Post.MOCK_POSTS) { post in
              FeedCell(post: post)
            }
          }
          .padding(.top, 8)
        }
        .navigationTitle("Feed")
        .navigationBarTitleDisplayMode(.inline)
        .toolbar {
          ToolbarItem(placement: .navigationBarLeading) {
            Image("appLogo")
              .resizable()
              .frame(width: 100,height: 32)
          }
          
          ToolbarItem(placement: .navigationBarTrailing) {
            Image(systemName: "paperplane")
              .imageScale(.large)
          }
        }
      }
    }
}

struct FeedView_Previews: PreviewProvider {
    static var previews: some View {
        FeedView()
    }
}