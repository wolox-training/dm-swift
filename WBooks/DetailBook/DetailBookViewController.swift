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

    private let detailViewController: DetailViewController
    private let commentsViewController: CommentsViewController
    
    init(detailBookViewModel: DetailBookViewModel) {
        self.detailBookViewModel = detailBookViewModel
        
        let detailViewModel = detailBookViewModel.createDetailViewModel()
        detailViewController = DetailViewController(detailViewModel: detailViewModel)
        
        let commentsViewModel = detailBookViewModel.createCommentsViewModel()
        commentsViewController = CommentsViewController(commentsViewModel: commentsViewModel)
        
        super.init(nibName: nil, bundle: nil)
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = NSLocalizedString("TITLE_DETAILBOOK", comment: "")
        addSectionDetail(detailViewController)
        addSectionComments(commentsViewController)
    }
    
    override func loadView() {
        view = detailBookView
    }
    
    private func addSectionDetail(_ child: UIViewController) {
        addChild(child)
        child.view.frame = detailBookView.generalView.frame
        detailBookView.generalView.addSubview(child.view)
        child.didMove(toParent: self)
    }
    
    private func addSectionComments(_ child: UIViewController) {
        addChild(child)
        child.view.frame = detailBookView.commentsView.frame
        detailBookView.commentsView.addSubview(child.view)
        child.didMove(toParent: self)
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
