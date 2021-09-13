//
//  DetailView.swift
//  WBooks
//
//  Created by daniel.f.munoz on 30/08/21.
//

import Foundation
import UIKit

final class DetailView: NibView {
    
    @IBOutlet var viewGeneral: UIView! {
        didSet {
            viewGeneral.backgroundColor = .white
            viewGeneral.layer.cornerRadius = 10
            viewGeneral.layer.shadowColor = UIColor.darkGray.cgColor
            viewGeneral.layer.shadowOffset = CGSize(width: 0.0, height: 0.1)
            viewGeneral.layer.shadowOpacity = 0.2
            viewGeneral.layer.shadowRadius = 3
            viewGeneral.layer.masksToBounds = false
        }
    }
    
    @IBOutlet weak var bookImage: UIImageView!
    
    @IBOutlet weak var titleLabel: UILabel! {
        didSet {
            titleLabel.font = .gillSansBoldTitle
        }
    }
    
    @IBOutlet weak var statusLabel: UILabel! {
        didSet {
            statusLabel.font = .gillSansBoldSubtitle
            statusLabel.textColor = .wildWillow
        }
    }
    
    @IBOutlet weak var authorLabel: UILabel! {
        didSet {
            authorLabel.font = .gillSansSubtitle
            authorLabel.textColor = .lightGray
        }
    }
    
    @IBOutlet weak var yearLabel: UILabel! {
        didSet {
            yearLabel.font = .gillSansSubtitle
            yearLabel.textColor = .lightGray
        }
    }
    
    @IBOutlet weak var genreLabel: UILabel! {
        didSet {
            genreLabel.font = .gillSansSubtitle
            genreLabel.textColor = .lightGray
        }
    }
    
    @IBOutlet weak var addWishlistButton: UIButton! {
        didSet {
            addWishlistButton.setTitle(NSLocalizedString("BUTTON_WIHSLIST", comment: ""), for: .normal)
            addWishlistButton.backgroundWhite()
        }
    }
    
    @IBOutlet weak var rentButton: UIButton! {
        didSet {
            rentButton.setTitle(NSLocalizedString("BUTTON_RENT", comment: ""), for: .normal)
            rentButton.withGradient()
        }
    }
    
}
