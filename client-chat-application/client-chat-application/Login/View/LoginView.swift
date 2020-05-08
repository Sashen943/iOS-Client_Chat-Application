//
//  LoginView.swift
//  client-chat-application
//
//  Created by Sashen Pillay on 2020/05/07.
//  Copyright © 2020 Sashen Pillay. All rights reserved.
//

import Foundation
import UIKit

protocol LoginView {
    func showLoadingIndicator()
    func hideLoadingIndicator()
    func showKnownError(_ errorMessage: String)
    func showUnknownError()
    func showErrorWithRetryAction(_ target: Any, _ action: Selector, _ errorMessage: String)
    func navigateToViewController(_ viewController: UIViewController)
    func configureLoginTitleLabel(_ title: String)
    func configureUsernameTextField(_ placeholder: String)
    func configurePasswordTextField(_ placeholer: String)
    func configureLoginButton(_ target: Any, _ action: Selector, _ buttonTitle: String)
    func configureCredentialsLabel()
    func showCredentialsLabel(_ message: String)
    func hideCredentialsLabel()
    func fetchUsername() -> String?
    func fetchPassword() -> String?
    func navigateToContactsViewController()
}
