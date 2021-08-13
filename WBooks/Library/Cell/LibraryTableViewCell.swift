//
//  LibraryTableViewCell.swift
//  WBooks
//
//  Created by daniel.f.munoz on 12/08/21.
//

import UIKit

class LibraryTableViewCell: UITableViewCell {
    
    @IBOutlet weak var containerView: UIView! {
        didSet {
            containerView.layer.cornerRadius = 10
            containerView.layer.shadowColor = UIColor.darkGray.cgColor
            containerView.layer.shadowOffset = CGSize(width: 0.0, height: 0.1)
            containerView.layer.shadowOpacity = 0.2
            containerView.layer.shadowRadius = 3
            containerView.layer.masksToBounds = false
        }
    }
    @IBOutlet weak var bookImage: UIImageView! {
        didSet {
            bookImage.contentMode = .scaleAspectFill
        }
    }
    @IBOutlet weak var titleLabel: UILabel! {
        didSet {
            titleLabel.font = UIFont.booksTitle
            titleLabel.textColor = UIColor.darkGray
        }
    }
    @IBOutlet weak var autorLabel: UILabel! {
        didSet {
            autorLabel.font = UIFont.booksAuthor
            autorLabel.textColor = UIColor.lightGray
        }
    }
    
    static let identifier = "LibraryTableViewCell"
    static let nibName = "LibraryTableViewCell"
    
    var data: Book!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        contentView.backgroundColor = UIColor.booksLigthGray
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
    func setData(_ data: Book) {
        self.data = data
        titleLabel.text = data.title
        autorLabel.text = data.autor
        bookImage?.image = UIImage(named: data.image!)
    }

}
