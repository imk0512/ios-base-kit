//
//  RegistrationViewModel.swift
//  base-kit
//
//  Created by 緒方亮平 on 2023/11/05.
//

import Foundation

class RegistrationViewModel: ObservableObject {
  @Published var username = ""
  @Published var email = ""
  @Published var password = ""
  
  func createUser() async throws {
    try await AuthService.shared.createUser(email: email, password: password, username: username)
    
    username = ""
    email = ""
    password = ""
  }
}
