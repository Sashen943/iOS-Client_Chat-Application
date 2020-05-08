//
//  ContactRepositoryImplementation.swift
//  client-chat-application
//
//  Created by Sashen Pillay on 2020/05/08.
//  Copyright © 2020 Sashen Pillay. All rights reserved.
//

import Foundation

class ContactRepositoryImplementation: ContactsRepository {
    
    // MARK: dependencies
    
    let contactsService = ContactServiceImplementation()
    
    // MARK: method(s)
    
    func fetchFriends(_ guid: String, _ firstName: String, completionHandler: @escaping (Result<[Friend], Error>) -> Void) {
        contactsService.fetchContacts(guid, firstName) { (result) in
            var friends = [Friend]()
            switch result {
            case .success(let data):
                do {
                    let decodedContacts = try JSONDecoder()
                        .decode(FriendsResponse.self, from: data)
                    if let decodedFriends = decodedContacts.friends {
                        friends = decodedFriends
                    }
                    completionHandler(Result.success(friends))
                } catch(let error) {
                    completionHandler(Result.failure(error))
                }
            case .failure(let error):
                completionHandler(Result.failure(error))
            }
        }
    }
    
}
