//
//  RentalsViewController.swift
//  WBooks
//
//  Created by daniel.f.munoz on 19/08/21.
//

import UIKit

class RentalsViewController: UIViewController {
    
    private lazy var rentalsView = RentalsView()
    private let rentalsViewModel: RentalsViewModel
    
    init(rentalsViewModel: RentalsViewModel) {
        self.rentalsViewModel = rentalsViewModel
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        navigationController?.navigationBar.topItem?.title = NSLocalizedString("TITLE_RENTALS", comment: "")
    }
    
    override func loadView() {
        view = rentalsView
    }

}
