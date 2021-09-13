//
//  SuggestionsCollectionViewCell.swift
//  WBooks
//
//  Created by daniel.f.munoz on 9/09/21.
//

import UIKit

class SuggestionsCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet weak var suggestBookImage: UIImageView! {
        didSet {
            suggestBookImage.contentMode = .scaleAspectFit
        }
    }
    
    static let identifier = "SuggestionsCollectionViewCell"
    static let nibName = "SuggestionsCollectionViewCell"
    
    override func awakeFromNib() {
        super.awakeFromNib()
        contentView.backgroundColor = UIColor.blackSqueeze
    }
    
    func setData(_ book: Suggestion) {
        suggestBookImage.imageFromUrl(urlString: book.link)
    }
    
}
