//
//  ImageService.swift
//  client-chat-application
//
//  Created by Sashen Pillay on 2020/05/08.
//  Copyright © 2020 Sashen Pillay. All rights reserved.
//

import Foundation

protocol ImageService {
    func fetchImage(_ urlString: String, completionHandler: @escaping (_ data: Data?) -> ())
}
