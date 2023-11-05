//
//  ContentView.swift
//  base-kit
//
//  Created by 緒方亮平 on 2023/11/04.
//

import SwiftUI

struct ContentView: View {
  @StateObject var viewModel = ContentViewModel()
  @StateObject var registrationViewModel = RegistrationViewModel()
  var body: some View {
    Group {
      if viewModel.userSession == nil {
        LoginView()
          .environmentObject(registrationViewModel)
      } else if let currentUser = viewModel.currentUser {
        MainTabView(user: currentUser)
      }
    }
  }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
