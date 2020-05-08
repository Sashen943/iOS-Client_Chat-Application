//
//  ContactTableViewCell.swift
//  client-chat-application
//
//  Created by Sashen Pillay on 2020/05/08.
//  Copyright © 2020 Sashen Pillay. All rights reserved.
//

import UIKit

class ContactTableViewCell: UITableViewCell {
    
    // MARK: IBOutlet(s)
    
    @IBOutlet weak var contactAliasLabel: UILabel!
    @IBOutlet weak var contactImageView: UIImageView!
    @IBOutlet weak var lastSeenLabel: UILabel!
    @IBOutlet weak var informationButton: UIButton!
    
    // MARK: Attribute(s)
    
    var friend: Friend?
    var delegate: ContactTableViewCellDelegate?
    
    // MARK: Lifecycle
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
    // MARK: Method(s)
    
    func configureCell(_ friend: Friend) {
        self.friend = friend
        self.setAlias()
        self.setStatus()
        self.setImage()
        self.configureInformationButton() 
    }
    
    func setAlias() {
        self.contactAliasLabel.text = friend?.alias ?? ""
    }
    
    func setStatus() {
        self.lastSeenLabel.text = friend?.status ?? ""
    }
    
    func setImage() {
        contactImageView.makeRounded()
        let url = friend?.imageURL ?? ""
        fetchImage(url) { (imageData) in
            if let data = imageData {
                DispatchQueue.main.async {
                    self.contactImageView.image = UIImage(data: data)
                }
            }
        }
    }
    
    private func fetchImage(_ urlString: String, completionHandler: @escaping (_ data: Data?) -> ()) {
        let session = URLSession.shared
        let url = URL(string: urlString)
        let dataTask = session.dataTask(with: url!) { (data, response, error) in
            if error != nil { completionHandler(nil) } else {
                completionHandler(data)
            }
        }
        dataTask.resume()
    }
    
    private func configureInformationButton() {
        informationButton.addTarget(self,
                                    action: #selector(self.informationButtonTap),
                                    for: .touchUpInside)
    }
    
    @objc func informationButtonTap() {
        if let friend = self.friend {
            self.delegate?.didClickOnInformationButton(withContact: friend)
        }
    }
    
}
