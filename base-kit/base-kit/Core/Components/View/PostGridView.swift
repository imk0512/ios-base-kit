//
//  PostGridView.swift
//  base-kit
//
//  Created by 緒方亮平 on 2023/11/05.
//

import SwiftUI

struct PostGridView: View {
  @StateObject var viewModel: PostGridViewModel
  
  init(user: User) {
    self._viewModel = StateObject(wrappedValue: PostGridViewModel(user: user))
  }
  
  private let gridItems: [GridItem] = [
    .init(.flexible(), spacing: 1),
    .init(.flexible(), spacing: 1),
    .init(.flexible(), spacing: 1)
  ]
  
  private let imageDimension: CGFloat = (UIScreen.main.bounds.width / 3) - 1
  
    var body: some View {
      LazyVGrid(columns: gridItems,spacing: 1) {
        ForEach(viewModel.posts) { post in
          Image(post.imageUrl)
            .resizable()
            .scaledToFill()
            .frame(width: imageDimension, height: imageDimension)
            .clipped()
        }
      }
    }
}

struct PostGridView_Previews: PreviewProvider {
    static var previews: some View {
      PostGridView( user: User.MOC_USERS[0])
    }
}
