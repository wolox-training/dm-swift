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
    @IBOutlet weak var generalView: UIView!{
        didSet{
            generalView.backgroundColor = .white
            generalView.layer.cornerRadius = 10
            generalView.layer.shadowColor = UIColor.darkGray.cgColor
            generalView.layer.shadowOffset = CGSize(width: 0.0, height: 0.1)
            generalView.layer.shadowOpacity = 0.2
            generalView.layer.shadowRadius = 3
            generalView.layer.masksToBounds = false
        }
    }
    @IBOutlet weak var bookImage: UIImageView!
    @IBOutlet weak var titleLabel: UILabel!{
        didSet{
            titleLabel.font = .gillSansBoldTitle
        }
    }
    @IBOutlet weak var statusLabel: UILabel!{
        didSet{
            statusLabel.font = .gillSansBoldSubtitle
            statusLabel.textColor = .wildWillow
        }
    }
    @IBOutlet weak var authorLabel: UILabel!{
        didSet{
            authorLabel.font = .gillSansSubtitle
            authorLabel.textColor = .lightGray
        }
    }
    @IBOutlet weak var yearLabel: UILabel!{
        didSet{
            yearLabel.font = .gillSansSubtitle
            yearLabel.textColor = .lightGray
        }
    }
    @IBOutlet weak var genreLabel: UILabel!{
        didSet{
            genreLabel.font = .gillSansSubtitle
            genreLabel.textColor = .lightGray
        }
    }
    @IBOutlet weak var addWishlistButton: UIButton!{
        didSet{
            addWishlistButton.setTitle(NSLocalizedString("BUTTON_WIHSLIST", comment: ""), for: .normal)
            addWishlistButton.layer.masksToBounds =  true
            addWishlistButton.layer.cornerRadius = addWishlistButton.frame.size.height/2
            addWishlistButton.layer.borderWidth = 2.0
            addWishlistButton.layer.borderColor = UIColor.cornflower.cgColor
        }
    }
    @IBOutlet weak var rentButton: UIButton!{
        didSet{
            rentButton.setTitle(NSLocalizedString("BUTTON_RENT", comment: ""), for: .normal)
            rentButton.tintColor = .white
            rentButton.setBackgroundImage(.blueButton, for: .normal)
            rentButton.layer.cornerRadius = rentButton.frame.size.height / 2
            rentButton.layer.masksToBounds =  true
        }
    }
    @IBOutlet weak var commentsView: UIView!{
        didSet{
            commentsView.backgroundColor = .white
            commentsView.layer.cornerRadius = 10
            commentsView.layer.shadowColor = UIColor.darkGray.cgColor
            commentsView.layer.shadowOffset = CGSize(width: 0.0, height: 0.1)
            commentsView.layer.shadowOpacity = 0.2
            commentsView.layer.shadowRadius = 3
            commentsView.layer.masksToBounds = false
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
