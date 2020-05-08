//
//  FriendsResponse.swift
//  client-chat-application
//
//  Created by Sashen Pillay on 2020/05/08.
//  Copyright © 2020 Sashen Pillay. All rights reserved.
//

import Foundation

struct FriendsResponse: Codable {
    var result: Bool?
    var friends: [Friend]?
}
