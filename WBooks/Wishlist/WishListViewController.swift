//
//  WishlistViewController.swift
//  WBooks
//
//  Created by daniel.f.munoz on 18/08/21.
//

import UIKit

class WishListViewController: UIViewController {
    
    private lazy var wishListView = WishListView()
    private let wishListViewModel: WishlistViewModel
    
    init(wishListViewModel: WishlistViewModel) {
        self.wishListViewModel = wishListViewModel
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        navigationController?.navigationBar.topItem?.title = NSLocalizedString("TITLE_WISHLIST", comment: "")
    }
    
    override func loadView() {
        view = wishListView
    }

}
