//
//  ContactTableViewCellDelegate.swift
//  client-chat-application
//
//  Created by Sashen Pillay on 2020/05/08.
//  Copyright © 2020 Sashen Pillay. All rights reserved.
//

import Foundation

protocol ContactTableViewCellDelegate {
    func didClickOnInformationButton(withContact contact: Friend)
}
