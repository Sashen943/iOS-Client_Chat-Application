//
//  ContactDetailsView.swift
//  client-chat-application
//
//  Created by Sashen Pillay on 2020/05/08.
//  Copyright © 2020 Sashen Pillay. All rights reserved.
//

import Foundation
import UIKit

protocol ContactDetailsView {
    func showLoadingIndicator()
    func hideLoadingIndicator()
    func showKnownError(_ errorMessage: String)
    func showUnknownError()
    func showErrorWithRetryAction(_ target: Any, _ action: Selector, _ errorMessage: String)
    func navigateToViewController(_ viewController: UIViewController)
    func setContactImage(_ image: UIImage)
    func setFirstname(_ title: String, _ name: String)
    func setLastname(_ title: String, _ lastname: String)
    func setStatus(_ title: String, _ status: String)
    func setDateOfBirth(_ title: String, _ date: String)
}
