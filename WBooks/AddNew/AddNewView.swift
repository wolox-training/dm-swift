//
//  AddNewView.swift
//  WBooks
//
//  Created by daniel.f.munoz on 19/08/21.
//

import Foundation
import UIKit

final class AddNewView: NibView {
    
    @IBOutlet var view: UIView! {
        didSet {
            view.backgroundColor = UIColor.blackSqueeze
        }
    }
    @IBOutlet weak var containerView: UIView!{
        didSet{
            containerView.backgroundColor = .white
            containerView.layer.cornerRadius = 10
            containerView.layer.shadowColor = UIColor.darkGray.cgColor
            containerView.layer.shadowOffset = CGSize(width: 0.0, height: 0.1)
            containerView.layer.shadowOpacity = 0.2
            containerView.layer.shadowRadius = 3
            containerView.layer.masksToBounds = false
        }
    }
    @IBOutlet weak var addImageButton: UIButton!{
        didSet{
            addImageButton.setBackgroundImage(.addImage, for: .normal)
        }
    }
    @IBOutlet weak var bookNameTextField: CustomTextField!{
        didSet{
            bookNameTextField.placeholder = NSLocalizedString("BOOK_NAME_TEXTFIELD", comment: "")
        }
    }
    @IBOutlet weak var authorTextField: CustomTextField!{
        didSet{
            authorTextField.placeholder = NSLocalizedString("AUTHOR_TEXTIFLED", comment: "")
        }
    }
    @IBOutlet weak var yearTextField: CustomTextField!{
        didSet{
            yearTextField.placeholder = NSLocalizedString("YEAR_TEXTFIELD", comment: "")
        }
    }
    @IBOutlet weak var topicTextField: CustomTextField!{
        didSet{
            topicTextField.placeholder = NSLocalizedString("TOPIC_TEXTIFLED", comment: "")
        }
    }
    @IBOutlet weak var descriptionTextField: CustomTextField!{
        didSet{
            descriptionTextField.placeholder = NSLocalizedString("DESCRIPTION_TEXTIFLED", comment: "")
        }
    }
    @IBOutlet weak var submitButton: UIButton!{
        didSet{
            submitButton.setTitle(NSLocalizedString("BUTTON_SUBMIT", comment: ""), for: .normal)
            submitButton.withGradient()
        }
    }
    
}
