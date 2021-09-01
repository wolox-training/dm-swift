//
//  DetailBookViewController.swift
//  WBooks
//
//  Created by daniel.f.munoz on 25/08/21.
//

import UIKit

class DetailBookViewController: UIViewController {
    
    private lazy var detailBookView = DetailBookView()
    private let detailBookViewModel: DetailBookViewModel

    init(detailBookViewModel: DetailBookViewModel) {
        self.detailBookViewModel = detailBookViewModel
        super.init(nibName: nil, bundle: nil)
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = NSLocalizedString("TITLE_DETAILBOOK", comment: "")
        setupTable()
        setupView()
        setupActions()
        getComments()
    }
    
    override func loadView() {
        view = detailBookView
    }
    
    func setupTable() {
        detailBookView.tableView.delegate = self
        detailBookView.tableView.dataSource = self
    }
    
    func setupView() {
        let book = detailBookViewModel.book
        detailBookView.bookImage.imageFromUrl(urlString: book.image)
        detailBookView.titleLabel.text = book.title
        detailBookView.authorLabel.text = book.author
        detailBookView.yearLabel.text = book.year
        detailBookView.genreLabel.text = book.genre
        detailBookView.statusLabel.text = book.status
    }
    
    func setupActions() {
        detailBookView.rentButton.addTarget(self, action: #selector(rentPress), for: .touchUpInside)
        detailBookView.addWishlistButton.addTarget(self, action: #selector(addWishlistPress), for: .touchUpInside)
    }
    
    func getComments() {
        detailBookViewModel.getComments { comments in
            if !comments.isEmpty {
                self.detailBookView.tableView.reloadData()
            } else {
                self.detailBookView.commentsView.isHidden = true
            }
        }
    }
    
    @objc func rentPress(sender: UIButton){
        if (detailBookViewModel.isAvaibleRent()) {
            detailBookViewModel.rent(){ error in
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
        detailBookViewModel.addWishList()
    }
    
    func showAlert(title: String, message: String, buttonDone: String) {
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: buttonDone, style: .default, handler: nil))
        present(alert, animated: true)
    }

}

extension DetailBookViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return detailBookViewModel.comments.count
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableView.automaticDimension
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
                
        let cell = tableView.dequeueReusableCell(withIdentifier: CommentsTableViewCell.identifier, for: indexPath) as! CommentsTableViewCell
        
        detailBookViewModel.getUserComment(id: detailBookViewModel.getIdAuthor(indexPath.row)){ user in
            cell.setData(self.detailBookViewModel.comments[indexPath.row], user)
        }
        
        return cell
    }
    
}
