//
//  AuthenticationModel.swift
//  client-chat-application
//
//  Created by Sashen Pillay on 2020/05/07.
//  Copyright © 2020 Sashen Pillay. All rights reserved.
//

import Foundation

struct AuthenticationModel: Decodable {
    var firstName: String?
    var guid: String?
    var lastName: String?
    var result: Bool?
    
    var isAuthenticated: Bool {
        get {
            return result ?? false
        }
    }
}
