//
//  LoginViewController.swift
//  client-chat-application
//
//  Created by Sashen Pillay on 2020/04/24.
//  Copyright © 2020 Sashen Pillay. All rights reserved.
//

import UIKit

class LoginViewController: BaseViewController {
    
    // MARK: IBOutlet(s)
    
    @IBOutlet weak var loginTitleLabel: UILabel!
    @IBOutlet weak var usernameTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var loginButton: UIButton!
    @IBOutlet weak var credentialsLabel: UILabel!
    
    // MARK: Attribute(s)
    
    private lazy var viewModel = LoginViewModel(view: self)
    
    // MARK: Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        viewModel.configureUI()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        configureNavigationBar()
    }
    
    // MARK: Method(s)
    
    private func configureNavigationBar() {
        self.navigationController?.setNavigationBarHidden(true, animated: false)
    }
    
}

// MARK: extension LoginView

extension LoginViewController: LoginView {
    
    func configureLoginTitleLabel(_ title: String) {
        self.loginTitleLabel.text = title
    }
    
    func configureUsernameTextField(_ placeholder: String) {
        self.usernameTextField.placeholder = placeholder
    }
    
    func configurePasswordTextField(_ placeholer: String) {
        self.passwordTextField.placeholder = placeholer
    }
    
    func configureLoginButton(_ target: Any, _ action: Selector, _ buttonTitle: String) {
        self.loginButton.setTitle(buttonTitle, for: .normal)
        self.loginButton.addTarget(target, action: action, for: .touchUpInside)
    }
    
    func fetchUsername() -> String? {
        return usernameTextField.text
    }
    
    func fetchPassword() -> String? {
        return passwordTextField.text
    }
    
    func configureCredentialsLabel() {
        self.credentialsLabel.text = ""
        self.credentialsLabel.isHidden = true
    }
    func showCredentialsLabel(_ message: String) {
        self.credentialsLabel.isHidden = false
        self.credentialsLabel.text = message
    }
    func hideCredentialsLabel() {
        self.credentialsLabel.isHidden = true
    }
    
    func navigateToContactsViewController() {
        let contactsViewController = ContactsViewController()
        contactsViewController.authenticationModel = viewModel.authenticationModel
        self.navigateToViewController(contactsViewController)
    }
    
}
