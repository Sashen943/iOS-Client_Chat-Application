//
//  BaseView.swift
//  client-chat-application
//
//  Created by Sashen Pillay on 2020/04/24.
//  Copyright © 2020 Sashen Pillay. All rights reserved.
//

import Foundation
import UIKit

protocol BaseView {
    func showLoadingIndicator()
    func hideLoadingIndicator()
    func showKnownError(_ errorMessage: String)
    func showUnknownError()
    func showErrorWithRetryAction(_ target: Any, _ action: Selector, _ errorMessage: String)
    func navigateToViewController(_ viewController: UIViewController)
}
