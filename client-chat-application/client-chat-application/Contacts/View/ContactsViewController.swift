//
//  ContactsViewController.swift
//  client-chat-application
//
//  Created by Sashen Pillay on 2020/05/07.
//  Copyright © 2020 Sashen Pillay. All rights reserved.
//

import UIKit

class ContactsViewController: BaseViewController {
    
    var authenticationModel: AuthenticationModel?
    private var viewModel: ContactsViewModel?
    
    @IBOutlet weak var contactsTableView: UITableView!
    @IBOutlet weak var welcomeLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureViewModel()
    }
    
    @objc func rightButtonTapped() {
        self.navigationController?.popToRootViewController(animated: true)
    }
    
    private func configureViewModel() {
        guard let authenticationModel = self.authenticationModel else {
            self.logout()
            return
        }
        self.viewModel = ContactsViewModel(view: self, authenticationModel: authenticationModel)
        self.viewModel?.configureUI()
        self.viewModel?.fetchContacts()
    }
    
    private func logout() {
        self.authenticationModel = nil
        self.navigationController?.popToRootViewController(animated: true)
    }

}

extension ContactsViewController: ContactsView {
    
    func configureTableView() {
        self.registerTableViewCells()
        self.contactsTableView.delegate = self
        self.contactsTableView.dataSource = self
    }
    
    private func registerTableViewCells() {
        let contactCell = UINib(nibName: "ContactTableViewCell", bundle: nil)
        self.contactsTableView.register(contactCell, forCellReuseIdentifier: "contactCell")
    }
    
    func configureWelcomeLabel(_ welocmeText: String) {
        self.welcomeLabel.text = welocmeText
    }
    
    
    func configureNavigationBar(_ title: String) {
        self.navigationController?.setNavigationBarHidden(false, animated: true)
        self.navigationItem.setHidesBackButton(true, animated: false)
        navigationController?.navigationBar.isTranslucent = false
        self.title = title
    }
    
    func configureRightBarButton(_ buttonTitle: String) {
        let logoutButton = UIBarButtonItem(title: buttonTitle,
                                              style: .plain,
                                              target: self,
                                              action: #selector(self.rightButtonTapped))
        self.navigationItem.rightBarButtonItem = logoutButton
    }
    
    func showContacts() {
        self.contactsTableView.reloadData()
    }
}

extension ContactsViewController: UITableViewDataSource, UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel?.friends.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if let contactTableViewCell = tableView.dequeueReusableCell(withIdentifier: "contactCell") as? ContactTableViewCell {
            let index = indexPath.row
            let friend = viewModel?.friends[index] ?? Friend()
            contactTableViewCell.configureCell(friend)
            contactTableViewCell.delegate = self
            return contactTableViewCell
        }
        return UITableViewCell()
    }

}

extension ContactsViewController: ContactTableViewCellDelegate {
    
    func didClickOnInformationButton(withContact contact: Friend) {
        <#code#>
    }
}
