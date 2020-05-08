//
//  BaseViewController.swift
//  client-chat-application
//
//  Created by Sashen Pillay on 2020/04/24.
//  Copyright © 2020 Sashen Pillay. All rights reserved.
//

import UIKit

class BaseViewController: UIViewController, UINavigationControllerDelegate {
    
    // MARK: Attribute(s)
    
    let loadingIndicatorView = LoadingIndicatorView()
    let errorView = ErrorView()
    
    // MARK: Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationController?.delegate = self
    }
    
    // MARK: Method(s)
    
    private func showErrorView() {
        self.navigationController?.view.addSubview(errorView)
        self.navigationController?.view.bringSubviewToFront(errorView)
        self.errorView.frame = self.view.frame
    }
    
}

// MARK: extension BaseView

extension BaseViewController: BaseView {
    
    func navigateToViewController(_ viewController: UIViewController) {
        self.navigationController?.pushViewController(viewController, animated: true)
    }
    
    func showLoadingIndicator() {
        self.navigationController?.view.addSubview(loadingIndicatorView)
        self.loadingIndicatorView.frame = self.view.frame
        self.loadingIndicatorView.startLoading()
    }
    
    func hideLoadingIndicator() {
        self.loadingIndicatorView.startLoading()
        self.loadingIndicatorView.removeFromSuperview()
    }
    
    func showKnownError(_ errorMessage: String) {
        self.errorView.showKnowError(errorMessage)
        self.showErrorView()
    }
    
    func showUnknownError() {
        self.errorView.showUnknownError()
        self.showErrorView()
    }
    
    func showErrorWithRetryAction(_ target: Any, _ action: Selector, _ errorMessage: String) {
        self.errorView.showKnowErrorMessageWithRetryAction(target, action, errorMessage)
        self.showErrorView()
    }
    
}
