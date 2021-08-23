//
//  SettingsViewController.swift
//  WBooks
//
//  Created by daniel.f.munoz on 19/08/21.
//

import UIKit

class SettingsViewController: UIViewController {
    
    private lazy var settingsView = SettingsView()
    private let _settingsViewModel: SettingsViewModel
    
    init(settingsViewModel: SettingsViewModel) {
        _settingsViewModel = settingsViewModel
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        navigationController?.navigationBar.topItem?.title = NSLocalizedString("TITLE_SETTINGS", comment: "")
    }
    
    override func loadView() {
        view = settingsView
    }
    
}
