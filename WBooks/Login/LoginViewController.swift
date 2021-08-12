//
//  LoginViewController.swift
//  WBooks
//
//  Created by Daniel Muñoz  on 10/08/21.
//

import UIKit

class LoginViewController: UIViewController {
    
    private lazy var loginView = LoginView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        loginView.loginButton.addTarget(self, action: #selector(loginPressed), for: .touchUpInside)
    }
    
    override func loadView() {
        view = loginView
    }
    
    @objc private func loginPressed(){
        debugPrint("Ingresando...")
    }

}
