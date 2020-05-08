//
//  ContactService.swift
//  client-chat-application
//
//  Created by Sashen Pillay on 2020/05/08.
//  Copyright © 2020 Sashen Pillay. All rights reserved.
//

import Foundation

protocol ContactService {
    func fetchContacts(_ guid: String, _ firstname: String, completionHandler: @escaping (Result<Data, Error>) -> Void)
}
