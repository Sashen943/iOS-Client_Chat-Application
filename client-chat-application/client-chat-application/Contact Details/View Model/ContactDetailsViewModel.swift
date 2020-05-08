//
//  ContactDetailsViewModel.swift
//  client-chat-application
//
//  Created by Sashen Pillay on 2020/05/08.
//  Copyright © 2020 Sashen Pillay. All rights reserved.
//

import Foundation
import UIKit

class ContactDetailsViewModel {
    
    // MARK: Dependencies
    
    var view: ContactDetailsView?
    var friend: Friend?
    let contactDetailsRepository = ContactDetailsRepositoryImplementation()
    
    // MARK: Constructor
    
    init(view: ContactDetailsView, friend: Friend) {
        self.view = view
        self.friend = friend
    }
    
    func configureUI() {
        self.view?.setFirstname("Name", friend?.firstName ?? "")
        self.view?.setLastname("Surname", friend?.lastName ?? "")
        self.view?.setStatus("Status", friend?.status ?? "")
        self.view?.setDateOfBirth("Date of birth", friend?.dateOfBirth ?? "")
    }
    
    @objc func fetchContactImage() {
        let url = friend?.imageURL ?? ""
        self.view?.showLoadingIndicator()
        DispatchQueue.global(qos: .background).async {
            self.contactDetailsRepository.fetchContacImage(url: url) { (result) in
                switch result {
                case .success(let image):
                    self.handleThatFetchImageSucceeds(image: image)
                case .failure(_):
                    self.handleThatFetchImageFails()
                }
            }
        }
    }
    
    private func handleThatFetchImageSucceeds(image: UIImage) {
        DispatchQueue.main.async {
            self.view?.setContactImage(image)
            self.view?.hideLoadingIndicator()
        }
    }
    
    private func handleThatFetchImageFails() {
        DispatchQueue.main.async {
            self.view?.hideLoadingIndicator()
            self.view?.showErrorWithRetryAction(self, #selector(self.fetchContactImage), "Something went wrong went trying to fetch this contacts display picture")
        }
    }
}
