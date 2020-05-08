//
//  ContactDetailsViewController.swift
//  client-chat-application
//
//  Created by Sashen Pillay on 2020/05/08.
//  Copyright © 2020 Sashen Pillay. All rights reserved.
//

import UIKit

class ContactDetailsViewController: BaseViewController {
    
    // MARK: IBOutlet(s)
    
    @IBOutlet weak var displayPictureImageView: UIImageView!
    @IBOutlet weak var firstnameTitleLabel: UILabel!
    @IBOutlet weak var firstnameLabel: UILabel!
    @IBOutlet weak var surenameTitleLabel: UILabel!
    @IBOutlet weak var surnameLabel: UILabel!
    @IBOutlet weak var dateOfBirthTitleLabel: UILabel!
    @IBOutlet weak var dateOfBirthLabel: UILabel!
    @IBOutlet weak var statusTitleLabel: UILabel!
    @IBOutlet weak var statusLabel: UILabel!
    
    // MARK: Dependencies
    
    var friend: Friend?
    var viewModel: ContactDetailsViewModel?
    
    // MARK: Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.setupViewModel()
    }
    
    // MARK: Method(s)
    
    private func setupViewModel() {
        if let friend = self.friend {
            viewModel = ContactDetailsViewModel(view: self, friend: friend)
            viewModel?.configureUI()
            viewModel?.fetchContactImage()
        }
    }
    
}

// MARK: ContactDetailsView extension

extension ContactDetailsViewController: ContactDetailsView {
    
    func setContactImage(_ image: UIImage) {
        self.displayPictureImageView.makeRounded()
        self.displayPictureImageView.image = image
    }
    
    func setFirstname(_ title: String, _ name: String) {
        self.firstnameTitleLabel.text = title
        self.firstnameLabel.text = name
    }
    
    func setLastname(_ title: String, _ lastname: String) {
        self.surenameTitleLabel.text = title
        self.surnameLabel.text = lastname
    }
    
    func setStatus(_ title: String, _ status: String) {
        self.statusTitleLabel.text = title
        self.statusLabel.text = status
    }
    
    func setDateOfBirth(_ title: String, _ date: String) {
        self.dateOfBirthTitleLabel.text = title
        self.dateOfBirthLabel.text = date
    }
    
}
