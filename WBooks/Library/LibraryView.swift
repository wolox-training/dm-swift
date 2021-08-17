//
//  LibraryView.swift
//  WBooks
//
//  Created by daniel.f.munoz on 12/08/21.
//

import Foundation
import UIKit

final class LibraryView: NibView {
    
    @IBOutlet weak var tableView: UITableView! {
        didSet {
            let nib = UINib(nibName: LibraryTableViewCell.nibName, bundle: nil)
            tableView.register(nib, forCellReuseIdentifier: LibraryTableViewCell.identifier)
            tableView.separatorStyle = .none
            tableView.backgroundColor = UIColor.blackSqueeze
        }
    }
    
}
