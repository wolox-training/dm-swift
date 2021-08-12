//
//  LoginView.swift
//  WBooks
//
//  Created by daniel.f.munoz on 12/08/21.
//

import Foundation
import UIKit

final class LoginView: NibView {
    
    @IBOutlet weak var titleLabel: UILabel!{
        didSet {
            titleLabel.text = "Login"
        }
    }
    @IBOutlet weak var loginButton: UIButton!{
        didSet {
            loginButton.titleLabel?.text = "Ingresar"
        }
    }
    
}

