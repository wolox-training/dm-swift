//
//  WishlistViewController.swift
//  WBooks
//
//  Created by daniel.f.munoz on 18/08/21.
//

import UIKit

class WishListViewController: UIViewController {
    
    private lazy var wishListView = WishListView()

    override func viewDidLoad() {
        super.viewDidLoad()
        navigationController?.navigationBar.topItem?.title = NSLocalizedString("TITLE_WISHLIST", comment: "")
    }
    
    override func loadView() {
        view = wishListView
    }

}
