//
//  ContactServiceImplementation.swift
//  client-chat-application
//
//  Created by Sashen Pillay on 2020/05/08.
//  Copyright © 2020 Sashen Pillay. All rights reserved.
//

import Foundation

class ContactServiceImplementation: ContactService {
    
    let url = URL(string: "http://mobileexam.dstv.com/friends")!
    
    func fetchContacts(_ guid: String, _ firstname: String, completionHandler: @escaping (Result<Data, Error>) -> Void) {

        let url = URL(string: "http://mobileexam.dstv.com/friends;uniqueID=\(guid);name=\(firstname)")!
        let request = URLRequest(url: url)
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
    
    
}
