//
//  LoginViewModel.swift
//  client-chat-application
//
//  Created by Sashen Pillay on 2020/05/07.
//  Copyright © 2020 Sashen Pillay. All rights reserved.
//

import Foundation

class LoginViewModel {
    
    // MARK: Dependencies
    
    private var loginRepository = LoginRepositoryImplementation()
    private var view: LoginView?
    
    // MARK: Attribute(s)
    
    private var username: String = ""
    private var password: String = ""
    var authenticationModel: AuthenticationModel?
    
    // MARK: Constructor
    
    init(view: LoginView) {
        self.view = view
    }
    
    // MARK: Method(s)
    
    func configureUI() {
        view?.configureLoginTitleLabel("ChatApp Login")
        view?.configureUsernameTextField("Username")
        view?.configurePasswordTextField("Password")
        view?.configureCredentialsLabel()
        view?.configureLoginButton(self, #selector(self.performLogin), "Login")
    }
    
    @objc func performLogin() {
        self.setLoginCredentials()
        self.view?.hideCredentialsLabel()
        if(validateCredentials()) {
            self.view?.showLoadingIndicator()
            DispatchQueue.global(qos: .background).async {
                self.loginRepository.login(self.username, self.password) { (result) in
                    switch result {
                    case .success(let authenticationModel):
                        self.handleThatLoginSucceeds(authenticationModel)
                    case .failure(let error):
                        self.handleThatLoginFails(error)
                    }
                }
            }
        } else {
            showInvalidCredentialsLabel()
        }
    }
    
    private func showInvalidCredentialsLabel() {
        self.view?.showCredentialsLabel("Please enter a valid user name and password.")
    }
    
    private func showInvalidUsernameAndPassword() {
        self.view?.showCredentialsLabel("It seems that the username or password is incorrect.")
    }
    
    private func handleThatLoginSucceeds(_ authenticationModel: AuthenticationModel) {
        DispatchQueue.main.async {
            self.view?.hideLoadingIndicator()
            switch authenticationModel.isAuthenticated {
            case true:
                self.authenticationModel = authenticationModel
                self.view?.navigateToContactsViewController()
            case false:
                self.showInvalidUsernameAndPassword()
            }
        }
    }
    
    private func handleThatLoginFails(_ error: Error) {
        DispatchQueue.main.async {
            self.view?.hideLoadingIndicator()
            self.view?.showKnownError(error.localizedDescription)
        }
    }
    
    func setLoginCredentials() {
        self.username = view?.fetchUsername() ?? ""
        self.password = view?.fetchPassword() ?? ""
    }
    
    private func validateCredentials() -> Bool {
        var credentialsAreValid = false
        credentialsAreValid = validatePassword()
        credentialsAreValid = validateUsername()
        return credentialsAreValid
    }
    
    private func validateUsername() -> Bool {
        return username.count > 0 ? true : false
    }
    
    private func validatePassword() -> Bool {
        return password.count > 0 ? true : false
    }
}
