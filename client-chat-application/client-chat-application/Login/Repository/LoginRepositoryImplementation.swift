//
//  LoginRepositoryImplementation.swift
//  client-chat-application
//
//  Created by Sashen Pillay on 2020/05/07.
//  Copyright © 2020 Sashen Pillay. All rights reserved.
//

import Foundation

class LoginRepositoryImplementation: LoginRepository {
    
    // MARK: Dependencies
    
    let loginService = LoginServiceImplementation()
    
    func login(_ username: String, _ password: String, completionHanlder: @escaping (Result<AuthenticationModel, Error>) -> Void) {
        loginService.login(username: username, password: password) { (result) in
            switch result {
            case .success(let data):
                do {
                    let authenticatedModel = try JSONDecoder().decode(AuthenticationModel.self, from: data)
                    completionHanlder(Result.success(authenticatedModel))
                } catch(let error) {
                    completionHanlder(Result.failure(error))
                }
            case .failure(let error):
                completionHanlder(Result.failure(error))
            }
        }
    }
    
}
