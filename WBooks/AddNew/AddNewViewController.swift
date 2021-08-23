//
//  AddNewViewController.swift
//  WBooks
//
//  Created by daniel.f.munoz on 19/08/21.
//

import UIKit

class AddNewViewController: UIViewController {
    
    private lazy var addNewView = AddNewView()
    private let _addNewViewModel: AddNewViewModel
    
    init(addNewViewModel: AddNewViewModel) {
        _addNewViewModel = addNewViewModel
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationController?.navigationBar.topItem?.title = NSLocalizedString("TITLE_ADDNEW", comment: "")
    }
    
    override func loadView() {
        view = addNewView
    }

}
