//
//  UserState.swift
//  base-kit
//
//  Created by 緒方亮平 on 2023/11/04.
//

import SwiftUI

struct UserStateView: View {
  let value: Int
  let title: String
  
    var body: some View {
      VStack {
        Text("\(value)")
          .font(.subheadline)
          .fontWeight(.semibold )
        
        Text(title)
          .font(.footnote)
      }
      .frame(width: 76)
    }
}

struct UserStateView_Previews: PreviewProvider {
    static var previews: some View {
      UserStateView(value: 12, title: "Posts")
    }
}
