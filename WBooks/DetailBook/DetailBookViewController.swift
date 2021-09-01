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

}
