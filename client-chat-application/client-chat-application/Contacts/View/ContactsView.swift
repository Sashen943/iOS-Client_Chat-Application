//
//  ContactsTableView.swift
//  client-chat-application
//
//  Created by Sashen Pillay on 2020/05/08.
//  Copyright © 2020 Sashen Pillay. All rights reserved.
//

import Foundation
import UIKit

protocol ContactsView {
    func showLoadingIndicator()
    func hideLoadingIndicator()
    func showKnownError(_ errorMessage: String)
    func showUnknownError()
    func showErrorWithRetryAction(_ target: Any, _ action: Selector, _ errorMessage: String)
    func navigateToViewController(_ viewController: UIViewController)
    func configureTableView()
    func configureWelcomeLabel(_ welocmeText: String)
    func configureNavigationBar(_ title: String)
    func configureRightBarButton(_ buttonTitle: String)
    func showContacts()
}
