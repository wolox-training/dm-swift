//
//  LibraryView.swift
//  WBooks
//
//  Created by daniel.f.munoz on 12/08/21.
//

import Foundation
import UIKit

final class LibraryView: NibView {
    
    @IBOutlet var generalView: UIView! {
        didSet{
            generalView.backgroundColor = UIColor.blackSqueeze
        }
    }
    @IBOutlet weak var booksContent: UIView!
    
}
