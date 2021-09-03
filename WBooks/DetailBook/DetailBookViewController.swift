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
        addSection(detailViewController, detailBookView.generalView)
        addSection(commentsViewController, detailBookView.commentsView)
    }
    
    override func loadView() {
        view = detailBookView
    }
    
    private func addSection(_ child: UIViewController, _ viewFrame: UIView) {
        addChild(child)
        viewFrame.addSubview(child.view)
        viewFrame.addSubViewWithConstraints(child: child.view, parent: viewFrame)
        child.didMove(toParent: self)
    }

}
