//
//  ErrorView.swift
//  client-chat-application
//
//  Created by Sashen Pillay on 2020/04/24.
//  Copyright © 2020 Sashen Pillay. All rights reserved.
//

import UIKit

class ErrorView: UIView {
    
    // MARK: IBOutlet(s)
    
    @IBOutlet var contentView: UIView!
    @IBOutlet weak var dismissButton: UIButton!
    @IBOutlet weak var errorMessageLabel: UILabel!
    
    // MARK: Contructor(s)
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        initialiseView()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        initialiseView()
    }
    
    // MARK: Method(s)
    
    private func initialiseView() {
        Bundle.main.loadNibNamed("ErrorView",
                                 owner: self,
                                 options: nil)
        self.addSubview(contentView)
        self.contentView.frame = self.bounds
        self.contentView.autoresizingMask = [.flexibleHeight, .flexibleWidth]
    }
    
    func showKnowError(_ errorMessage: String) {
        self.showErrorMessage(errorMessage)
        self.dismissButton.setTitle("Dismiss", for: .normal)
    }
    
    func showUnknownError() {
        let errorMessage = "Oops! Something went wrong"
        self.dismissButton.setTitle("Dismiss", for: .normal)
        self.showErrorMessage(errorMessage)
    }
    
    func showKnowErrorMessageWithRetryAction(_ target: Any, _ action: Selector, _ errorMessage: String) {
        self.dismissButton.setTitle("Retry", for: .normal)
        self.dismissButton.addTarget(target, action: action, for: .touchUpInside)
        self.showErrorMessage(errorMessage)
    }
    
    private func showErrorMessage(_ errorMessage: String) {
        self.errorMessageLabel.text = errorMessage
        self.addDismissActionToButton()
    }
    
    
    private func addDismissActionToButton() {
        self.dismissButton.addTarget(self, action: #selector(self.dismissAction), for: .touchUpInside)
    }
    
    @objc func dismissAction() {
        self.removeFromSuperview()
    }
    
}
