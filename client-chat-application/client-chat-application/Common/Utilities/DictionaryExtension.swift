//
//  DictionaryExtension.swift
//  client-chat-application
//
//  Created by Sashen Pillay on 2020/05/07.
//  Copyright © 2020 Sashen Pillay. All rights reserved.
//

import Foundation

extension Dictionary {
    func percentEncoded() -> Data? {
        return map { key, value in
            return "\(key)=\(value)"
        }
        .joined(separator: "")
        .data(using: .utf8)
    }
}
