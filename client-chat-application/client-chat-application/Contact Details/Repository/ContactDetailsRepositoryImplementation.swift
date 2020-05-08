//
//  ContactDetailsRepositoryImplementation.swift
//  client-chat-application
//
//  Created by Sashen Pillay on 2020/05/08.
//  Copyright © 2020 Sashen Pillay. All rights reserved.
//

import Foundation
import UIKit

class ContactDetailsRepositoryImplementation: ContactDetailsRepository {
    
    // MARK: Dependencies
    
    let imageService = ImageServiceImplementation()
    
    // MARK: Attribute(s)
    
    let imageError = NSError(domain: "Failure fetching image", code: 0, userInfo: nil)
    
    func fetchContacImage(url: String, completionHandler: @escaping (Result<UIImage, Error>) -> Void) {
        imageService.fetchImage(url) { (data) in
            if let data = data {
                if let contactImage = UIImage(data: data) {
                    completionHandler(Result.success(contactImage))
                } else {
                    completionHandler(Result.failure(self.imageError))
                }
            }
        }
    }
    
    
}
