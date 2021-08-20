//
//  AddNewViewController.swift
//  WBooks
//
//  Created by daniel.f.munoz on 19/08/21.
//

import UIKit

class AddNewViewController: UIViewController {
    
    private lazy var addNewView = AddNewView()

    override func viewDidLoad() {
        super.viewDidLoad()
        navigationController?.navigationBar.topItem?.title = NSLocalizedString("TITLE_ADDNEW", comment: "")
    }
    
    override func loadView() {
        view = addNewView
    }

}
