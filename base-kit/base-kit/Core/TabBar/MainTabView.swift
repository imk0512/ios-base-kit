//
//  MainTabView.swift
//  base-kit
//
//  Created by 緒方亮平 on 2023/11/04.
//

import SwiftUI

struct MainTabView: View {
  let user: User
  @State private var selectedIndex = 0
  
  var body: some View {
    TabView(selection: $selectedIndex) {
      FeedView()
        .onAppear {
          selectedIndex = 0
        }
        .tabItem {
          Image(systemName: "house")
        }.tag(0)
      
      SearchView()
        .onAppear {
          selectedIndex = 1
        }
        .tabItem {
          Image(systemName: "magnifyingglass")
        }.tag(1)
      
      UploadPostView(tabIndex: $selectedIndex)
        .onAppear {
          selectedIndex = 2
        }
        .tabItem {
          Image(systemName: "plus.square")
        }.tag(2)
      
      Text("Notifications")
        .onAppear {
          selectedIndex = 3
        }
        .tabItem {
          Image(systemName: "heart")
        }.tag(3)
      
      CurrentUserProfileView(user: user)
        .onAppear {
          selectedIndex = 4
        }
        .tabItem {
          Image(systemName: "person")
        }.tag(4)
    }
    .accentColor(.black)
  }
}

struct MainTabView_Previews: PreviewProvider {
  static var previews: some View {
    MainTabView(user: User.MOC_USERS[0])
  }
}
