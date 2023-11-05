//
//  User.swift
//  base-kit
//
//  Created by 緒方亮平 on 2023/11/04.
//

import Foundation
import Firebase

struct User: Identifiable, Hashable, Codable {
  let id: String
  var username: String
  var profileImageUrl: String?
  var fullname: String?
  var bio: String?
  let email: String
  
  var isCurrentUser: Bool {
    guard let currentUid = Auth.auth().currentUser?.uid else { return false }
    return currentUid == id
  }
}

extension User {
  static var MOC_USERS: [User] = [
    .init(id: NSUUID().uuidString, username: "Brutus", profileImageUrl: nil, fullname: "Brutus Mag",bio: "毎月1日・15日の隔週刊行、ポップカルチャーの総合誌。最新号は「愛って。その答えが見つかる名作映画300」", email: "brutus@gmail.com"),
    .init(id: NSUUID().uuidString, username: "honda tsubasa", profileImageUrl: nil, fullname: "ホンダ　ツバサ",bio: "よく踊ったりゲームしてる人です。", email: "tsubasa@gmail.com"),
    .init(id: NSUUID().uuidString, username: "kopiyama_", profileImageUrl: nil, fullname: "こぴ",bio: "歌手・俳優", email: "kopi@gmail.com"),
    .init(id: NSUUID().uuidString, username: "asashihair", profileImageUrl: nil, fullname: "ASASHI",bio: "Hair Stylist Represented by Ota Office Tokyo.", email: "asahi@gmail.com"),
  ]
}
