//
//  ContactsViewModel.swift
//  client-chat-application
//
//  Created by Sashen Pillay on 2020/05/08.
//  Copyright © 2020 Sashen Pillay. All rights reserved.
//

import Foundation

class ContactsViewModel {
    
    // MARK: attribute(s)
    
    var friends: [Friend] = [Friend]()
    var guid: String {
        get { return authenticationModel?.guid ?? "" }
    }
    var firstname: String {
        get { return authenticationModel?.firstName ?? "" }
    }
    
    // MARK: dependencies
    
    var view: ContactsView?
    var authenticationModel: AuthenticationModel?
    let contactRepository = ContactRepositoryImplementation()
    
    // MARK: Constructor
    
    init(view: ContactsView, authenticationModel: AuthenticationModel) {
        self.view = view
        self.authenticationModel = authenticationModel
    }
    
    // MARK: Method(s)
    
    func configureUI() {
        self.view?.configureTableView()
        self.view?.configureNavigationBar("Friends")
        self.view?.configureRightBarButton("Logout")
        self.view?.configureWelcomeLabel("Logged in as \(firstname)")
    }
    
    @objc func fetchContacts() {
        self.view?.showLoadingIndicator()
        DispatchQueue.global(qos: .background).async {
            self.contactRepository.fetchFriends(self.guid, self.firstname) { (result) in
                switch result {
                case .success(let contacts):
                    self.handleThatFetchContactsSucceeds(contacts)
                case .failure(let error):
                    self.handleThatFetchContactsFails(error)
                }
            }
        }
    }
    
    private func handleThatFetchContactsSucceeds(_ friends: [Friend]) {
        DispatchQueue.main.async {
            self.friends = friends
            self.view?.showContacts()
            self.view?.hideLoadingIndicator()
        }
    }
    
    private func handleThatFetchContactsFails(_ error: Error) {
        DispatchQueue.main.async {
            self.view?.hideLoadingIndicator()
            self.view?.showErrorWithRetryAction(self,
                                                #selector(self.fetchContacts),
                                                "Something went wrong")
        }
        
        
    }
}
