//
//  SuggestionsView.swift
//  WBooks
//
//  Created by daniel.f.munoz on 6/09/21.
//

import Foundation
import UIKit

final class SuggestionsView: NibView {
    
    @IBOutlet weak var generalView: UIView! {
        didSet {
            generalView.backgroundColor = UIColor.blackSqueeze
        }
    }
    
    @IBOutlet weak var suggestionsTitle: UILabel! {
        didSet {
            suggestionsTitle.text = NSLocalizedString("TITLE_SUGGESTIONS", comment: "")
            suggestionsTitle.font = .KailasaBoldTitle
        }
    }
    
    @IBOutlet weak var suggestBooks: UICollectionView! {
        didSet {
            let nib = UINib(nibName: SuggestionsCollectionViewCell.nibName, bundle: nil)
            suggestBooks.register(nib, forCellWithReuseIdentifier: SuggestionsCollectionViewCell.identifier)
            suggestBooks.backgroundColor = UIColor.blackSqueeze
            suggestBooks.isScrollEnabled = true
        }
    }
    
}
