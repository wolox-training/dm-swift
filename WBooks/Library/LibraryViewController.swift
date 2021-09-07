//
//  LibraryViewController.swift
//  WBooks
//
//  Created by daniel.f.munoz on 12/08/21.
//

import UIKit

class LibraryViewController: UIViewController {
    
    private lazy var libraryView = LibraryView()
    private let libraryViewModel: LibraryViewModel
    
    private var booksViewController: BooksViewController
    
    init(libraryViewModel: LibraryViewModel) {
        self.libraryViewModel = libraryViewModel
        
        let booksViewModel = libraryViewModel.createBooksViewModel()
        booksViewController = BooksViewController(booksViewModel: booksViewModel)
        
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationController?.navigationBar.topItem?.title = NSLocalizedString("TITLE_LIBRARY", comment: "")
        setupActions()
        getRents()
    }
    
    func setupActions() {
        navigationItem.leftBarButtonItem = UIBarButtonItem(image: .notification, style: .plain, target: self, action: #selector(notificationPress))
        navigationItem.rightBarButtonItem = UIBarButtonItem(image: .search, style: .plain, target: self, action: #selector(searchPress))
    }
    
    func getRents() {
        libraryViewModel.getBooks() { [self] in
            let booksViewModel = libraryViewModel.createBooksViewModel()
            booksViewController = BooksViewController(booksViewModel: booksViewModel)
            addSection(booksViewController, libraryView.booksContent)
        }
    }
    
    override func loadView() {
        view = libraryView
    }
    
    @objc func notificationPress() {
        libraryViewModel.notification()
    }
    
    @objc func searchPress() {
        libraryViewModel.search()
    }
    
    private func addSection(_ child: UIViewController, _ viewFrame: UIView) {
        addChild(child)
        viewFrame.addSubview(child.view)
        viewFrame.addSubViewWithConstraints(child: child.view, parent: viewFrame)
        child.didMove(toParent: self)
    }

}
