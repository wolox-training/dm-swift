//
//  DetailViewController.swift
//  WBooks
//
//  Created by daniel.f.munoz on 30/08/21.
//

import UIKit

class DetailViewController: UIViewController {
    
    private lazy var detailView = DetailView()
    private let detailViewModel: DetailViewModel
    
    init(detailViewModel: DetailViewModel) {
        self.detailViewModel = detailViewModel
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
        setupActions()
    }
    
    override func loadView() {
        view = detailView
    }
    
    func setupView() {
        let book = detailViewModel.book
        detailView.bookImage.imageFromUrl(urlString: book.image)
        detailView.titleLabel.text = book.title
        detailView.authorLabel.text = book.author
        detailView.yearLabel.text = book.year
        detailView.genreLabel.text = book.genre
        detailView.statusLabel.text = book.status
    }
    
    func setupActions() {
        detailView.rentButton.addTarget(self, action: #selector(rentPress), for: .touchUpInside)
        detailView.addWishlistButton.addTarget(self, action: #selector(addWishlistPress), for: .touchUpInside)
    }
    
    @objc func rentPress(sender: UIButton){
        if (detailViewModel.isAvaibleRent()) {
            detailViewModel.rent(){ error in
                if error == nil {
                    self.showAlert(title: NSLocalizedString("TITLE_INFORMATION", comment: ""),
                                   message: NSLocalizedString("INFORMATION_SUCCESS", comment: ""),
                                   buttonDone: NSLocalizedString("BUTTON_DONE", comment: ""))
                } else {
                    self.showAlert(title: NSLocalizedString("TITLE_ERROR", comment: ""),
                                   message: NSLocalizedString("ERROR_GENERAL", comment: ""),
                                   buttonDone: NSLocalizedString("BUTTON_DONE", comment: ""))
                }
            }
        } else {
            self.showAlert(title: NSLocalizedString("TITLE_INFORMATION", comment: ""),
                           message: NSLocalizedString("ERROR_UNAVAILABLE", comment: ""),
                           buttonDone: NSLocalizedString("BUTTON_DONE", comment: ""))
        }
    }
    
    @objc func addWishlistPress(sender: UIButton){
        detailViewModel.addWishList()
    }
    
    func showAlert(title: String, message: String, buttonDone: String) {
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: buttonDone, style: .default, handler: nil))
        present(alert, animated: true)
    }
    
}
