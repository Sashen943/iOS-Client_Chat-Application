//
//  ContactDetailsRepository.swift
//  client-chat-application
//
//  Created by Sashen Pillay on 2020/05/08.
//  Copyright © 2020 Sashen Pillay. All rights reserved.
//

import Foundation
import UIKit

protocol ContactDetailsRepository {
    func fetchContacImage(url: String, completionHandler: @escaping (Result<UIImage, Error>) -> Void)
}
