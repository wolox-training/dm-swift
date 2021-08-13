//
//  LibraryView.swift
//  WBooks
//
//  Created by daniel.f.munoz on 12/08/21.
//

import Foundation
import UIKit

final class LibraryView: NibView {
    
    @IBOutlet weak var tableView: UITableView!{
        didSet{
            let libraryTableViewCell = LibraryTableViewCell()
            let nib = UINib.init(nibName: libraryTableViewCell.nibName, bundle: nil)
            tableView.register(nib, forCellReuseIdentifier: libraryTableViewCell.identifier)
            tableView.separatorStyle = .none
            tableView.backgroundColor = UIColor.init(red: 236, green: 246, blue: 249, alpha: 1)
        }
    }
    
}

