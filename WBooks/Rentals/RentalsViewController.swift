//
//  RentalsViewController.swift
//  WBooks
//
//  Created by daniel.f.munoz on 19/08/21.
//

import UIKit

class RentalsViewController: UIViewController {
    
    private lazy var rentalsView = RentalsView()

    override func viewDidLoad() {
        super.viewDidLoad()
        navigationController?.navigationBar.topItem?.title = NSLocalizedString("TITLE_RENTALS", comment: "")
    }
    
    override func loadView() {
        view = rentalsView
    }

}
