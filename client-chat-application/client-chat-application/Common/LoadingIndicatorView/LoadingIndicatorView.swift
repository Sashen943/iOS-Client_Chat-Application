//
//  LoadingIndicatorView.swift
//  client-chat-application
//
//  Created by Sashen Pillay on 2020/05/07.
//  Copyright © 2020 Sashen Pillay. All rights reserved.
//

import Foundation
import UIKit

class LoadingIndicatorView: UIView {
    
    // MARK: IBOutlet(s)
    
    @IBOutlet var contentView: UIView!
    @IBOutlet weak var activityIndicator: UIActivityIndicatorView!
    
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
        Bundle.main.loadNibNamed("LoadingIndicatorView",
                                 owner: self,
                                 options: nil)
        self.addSubview(contentView)
        self.contentView.frame = self.bounds
        self.contentView.autoresizingMask = [.flexibleHeight, .flexibleWidth]
    }
    
    func startLoading() {
        self.activityIndicator.startAnimating()
    }
    
    func endLoading() {
        self.activityIndicator.stopAnimating()
    }
    
}
