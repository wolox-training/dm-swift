//
//  RentalsView.swift
//  WBooks
//
//  Created by daniel.f.munoz on 19/08/21.
//

import Foundation
import UIKit

final class RentalsView: NibView {
    
    @IBOutlet var view: UIView! {
        didSet {
            view.backgroundColor = UIColor.blackSqueeze
        }
    }
    
    @IBOutlet weak var booksView: UIView!
    
    @IBOutlet weak var suggestionsBooksView: UIView!
    
}
