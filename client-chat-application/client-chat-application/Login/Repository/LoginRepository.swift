//
//  LoginRepository.swift
//  client-chat-application
//
//  Created by Sashen Pillay on 2020/05/07.
//  Copyright © 2020 Sashen Pillay. All rights reserved.
//

import Foundation

protocol LoginRepository {
    func login(_ username: String, _ password: String, completionHanlder: @escaping (Result<AuthenticationModel, Error>) -> Void)
}
