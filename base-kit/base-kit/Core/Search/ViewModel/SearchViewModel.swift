//
//  SearchViewModel.swift
//  base-kit
//
//  Created by 緒方亮平 on 2023/11/05.
//

import Foundation

class SearchViewModel: ObservableObject {
  @Published var users = [User]()
  
  init() {
    Task { try await fetchAllUsers() }
  }

  @MainActor
  func fetchAllUsers() async throws {
    self.users = try await UserService.fetchAllUser()
  }
}
