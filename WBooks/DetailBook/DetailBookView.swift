//
//  DetailBookView.swift
//  WBooks
//
//  Created by daniel.f.munoz on 25/08/21.
//

import Foundation
import UIKit

final class DetailBookView: NibView {
    
    @IBOutlet var view: UIView!{
        didSet{
            view.backgroundColor = UIColor.blackSqueeze
        }
    }
    @IBOutlet weak var generalView: UIView!
    @IBOutlet weak var commentsView: UIView!
    
}
