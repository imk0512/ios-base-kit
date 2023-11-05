//
//  ContentViewModel.swift
//  base-kit
//
//  Created by 緒方亮平 on 2023/11/05.
//

import Foundation
import Firebase
import Combine


class ContentViewModel: ObservableObject {
  
  private let service = AuthService.shared
  private var cancellables = Set<AnyCancellable>()
  
  @Published var userSession: FirebaseAuth.User?
  @Published var currentUser: User?
  
  init() {
    setupSubscribers()
  }
  
  func setupSubscribers() {
    service.$userSession.sink { [weak self] userSession in
      self?.userSession = userSession
    }
    .store(in: &cancellables)
    
    service.$currentUser.sink { [weak self] currentUser in
      self?.currentUser = currentUser
    }
    .store(in: &cancellables)
  }
}
