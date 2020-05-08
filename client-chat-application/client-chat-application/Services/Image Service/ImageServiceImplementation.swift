//
//  ImageServiceImplementation.swift
//  client-chat-application
//
//  Created by Sashen Pillay on 2020/05/08.
//  Copyright © 2020 Sashen Pillay. All rights reserved.
//

import Foundation

class ImageServiceImplementation: ImageService {
    func fetchImage(_ urlString: String, completionHandler: @escaping (_ data: Data?) -> ()) {
        let session = URLSession.shared
        let url = URL(string: urlString)
        let dataTask = session.dataTask(with: url!) { (data, response, error) in
            if error != nil { completionHandler(nil) } else {
                completionHandler(data)
            }
        }
        dataTask.resume()
    }
}
