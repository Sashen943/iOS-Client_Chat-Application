//
//  Contact.swift
//  client-chat-application
//
//  Created by Sashen Pillay on 2020/05/08.
//  Copyright © 2020 Sashen Pillay. All rights reserved.
//

import Foundation

struct Friend: Codable {
    var firstName: String?
    var lastName: String?
    var alias: String?
    var dateOfBirth: String?
    var imageURL: String?
    var status: String?
}
