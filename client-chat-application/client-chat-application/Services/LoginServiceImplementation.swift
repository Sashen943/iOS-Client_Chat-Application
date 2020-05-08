//
//  LoginServiceImplementation.swift
//  client-chat-application
//
//  Created by Sashen Pillay on 2020/05/07.
//  Copyright © 2020 Sashen Pillay. All rights reserved.
//

import Foundation

class LoginServiceImplementation: LoginService {
    
    let url = URL(string: "http://mobileexam.dstv.com/login")!
    
    func login(username: String, password: String, completionHandler: @escaping (Result<Data, Error>) -> Void) {
        let request = buildLoginRequest(username, password: password)
        let task = URLSession.shared.dataTask(with: request) { data, response, error in
            guard let data = data, let response = response as? HTTPURLResponse, error == nil else {
                completionHandler(Result.failure(error!))
                return
            }
            
            guard (200 ... 299) ~= response.statusCode else {
                let generalHttpError = NSError(domain:"",
                                               code:response.statusCode,
                                               userInfo:nil)
                completionHandler(Result.failure(generalHttpError))
                return
            }
            completionHandler(Result.success(data))
        }
        
        task.resume()
    }
    
    private func buildLoginRequest(_ username: String, password: String) -> URLRequest {
        var request = URLRequest(url: url)
        request.setValue("application/x-www-form-urlencoded",
                         forHTTPHeaderField: "Content-Type")
        request.httpMethod = "POST"
        let parameters: [String: Any] = ["username": username,
                                         "password": password]
        let jsonData = try? JSONSerialization.data(withJSONObject: parameters)
        request.httpBody = jsonData
        return request
    }
    
}
