//
//  LoginService.swift
//  client-chat-application
//
//  Created by Sashen Pillay on 2020/05/07.
//  Copyright © 2020 Sashen Pillay. All rights reserved.
//

import Foundation

protocol LoginService {
    func login(username: String, password: String, completionHandler: @escaping (Result<Data, Error>) -> Void)
}
