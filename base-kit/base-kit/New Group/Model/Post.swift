//
//  Post.swift
//  base-kit
//
//  Created by 緒方亮平 on 2023/11/05.
//

import Foundation
import Firebase

struct Post: Identifiable, Hashable, Codable {
  let id: String
  let ownerUid: String
  let caption: String
  var likes: Int
  let imageUrl: String
  let timestamp: Timestamp
  var user: User?
}

extension Post {
  static var MOCK_POSTS: [Post] = [
    .init(id: NSUUID().uuidString, ownerUid: NSUUID().uuidString, caption: "秋の夜長feat.やんやんパーティ🎈", likes: 123, imageUrl: "tuba1", timestamp: Timestamp() ,user: User.MOC_USERS[1]),
    .init(id: NSUUID().uuidString, ownerUid: NSUUID().uuidString, caption: "最近暑いけどzozoで買ったニット載せます🧶", likes: 103, imageUrl: "tuba2", timestamp: Timestamp() ,user: User.MOC_USERS[1]),
    .init(id: NSUUID().uuidString, ownerUid: NSUUID().uuidString, caption: "愛の映画を語る時、その人が理想とする愛の形が見えてくる。", likes: 55, imageUrl: "bru1", timestamp: Timestamp() ,user: User.MOC_USERS[0]),
    .init(id: NSUUID().uuidString, ownerUid: NSUUID().uuidString, caption: "ハロウィンをうんそっかハロウィンか〜って流すようになったのはいつからだろう🤷‍♂️", likes: 73, imageUrl: "tuba4", timestamp: Timestamp() ,user: User.MOC_USERS[1]),
    .init(id: NSUUID().uuidString, ownerUid: NSUUID().uuidString, caption: "BRUTUS最新号は「愛って。その答えが見つかる名作映画300」", likes: 66, imageUrl: "bru2", timestamp: Timestamp() ,user: User.MOC_USERS[0])
  ]
}
