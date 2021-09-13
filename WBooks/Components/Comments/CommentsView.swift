//
//  CommentsView.swift
//  WBooks
//
//  Created by daniel.f.munoz on 31/08/21.
//

import Foundation
import UIKit

final class CommentsView: NibView {
    
    @IBOutlet weak var generalView: UIView! {
        didSet {
            generalView.backgroundColor = .white
            generalView.layer.cornerRadius = 10
            generalView.layer.shadowColor = UIColor.darkGray.cgColor
            generalView.layer.shadowOffset = CGSize(width: 0.0, height: 0.1)
            generalView.layer.shadowOpacity = 0.2
            generalView.layer.shadowRadius = 3
            generalView.layer.masksToBounds = false
        }
    }
    
    @IBOutlet weak var tableView: UITableView! {
        didSet {
            let nib = UINib(nibName: CommentsTableViewCell.nibName, bundle: nil)
            tableView.register(nib, forCellReuseIdentifier: CommentsTableViewCell.identifier)
            tableView.separatorStyle = .none
            tableView.backgroundColor = .white
            tableView.isScrollEnabled = true
        }
    }
    
}
