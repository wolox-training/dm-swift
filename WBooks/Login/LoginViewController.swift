//
//  LoginViewController.swift
//  WBooks
//
//  Created by Daniel Muñoz  on 10/08/21.
//

import UIKit

class LoginViewController: UIViewController {
    
    private lazy var loginView = LoginView()
    private let loginViewModel: LoginViewModel
    
    init(loginViewModel: LoginViewModel) {
        self.loginViewModel = loginViewModel
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationController?.navigationBar.isHidden = true
        loginView.loginButton.addTarget(self, action: #selector(loginPressed), for: .touchUpInside)
    }
    
    override func loadView() {
        view = loginView
    }
    
    @objc private func loginPressed(){
        let tabBarController = TabBarController()
        navigationController?.setViewControllers([tabBarController], animated: true)
    }

}
