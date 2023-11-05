//
//  LoginViewModel.swift
//  base-kit
//
//  Created by 緒方亮平 on 2023/11/05.
//

import Foundation

class LoginViewModel: ObservableObject {
  @Published var email = ""
  @Published var password = ""
  
  func signIn() async throws {
    try? await AuthService.shared.login(withEmail: email, password: password)
  }
}
