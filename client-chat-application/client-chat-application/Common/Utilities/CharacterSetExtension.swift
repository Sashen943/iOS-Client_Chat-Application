//
//  CharacterSetExtension.swift
//  client-chat-application
//
//  Created by Sashen Pillay on 2020/05/07.
//  Copyright © 2020 Sashen Pillay. All rights reserved.
//

import Foundation

extension CharacterSet {
    static let urlQueryValueAllowed: CharacterSet = {
        var allowed = CharacterSet.urlQueryAllowed
        return allowed
    }()
}
