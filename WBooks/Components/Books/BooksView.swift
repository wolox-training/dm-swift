//
//  BooksView.swift
//  WBooks
//
//  Created by daniel.f.munoz on 6/09/21.
//

import Foundation
import UIKit

final class BooksView: NibView {
    
    @IBOutlet var generalView: UIView! {
        didSet{
            generalView.backgroundColor = UIColor.blackSqueeze
        }
    }
    @IBOutlet weak var tableView: UITableView! {
        didSet {
            let nib = UINib(nibName: LibraryTableViewCell.nibName, bundle: nil)
            tableView.register(nib, forCellReuseIdentifier: LibraryTableViewCell.identifier)
            tableView.separatorStyle = .none
            tableView.backgroundColor = UIColor.blackSqueeze
        }
    }
    
}
