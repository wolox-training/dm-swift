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
    
    private var booksViewController: BooksViewController
    private var suggestionsViewController: SuggestionsViewController
    
    init(rentalsViewModel: RentalsViewModel) {
        self.rentalsViewModel = rentalsViewModel
        
        let booksViewModel = rentalsViewModel.createBooksViewModel()
        booksViewController = BooksViewController(booksViewModel: booksViewModel)
        
        let suggestionViewModel = rentalsViewModel.createSuggestViewModel()
        suggestionsViewController = SuggestionsViewController(suggestionsViewModel: suggestionViewModel)
        
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        navigationController?.navigationBar.topItem?.title = NSLocalizedString("TITLE_RENTALS", comment: "")
        getSuggestionsBooks()
        getRentalsBooks()
    }
    
    override func loadView() {
        view = rentalsView
    }
    
    func getSuggestionsBooks() {
        rentalsViewModel.getSuggestBooks() { [self] in
            let suggestionViewModel = rentalsViewModel.createSuggestViewModel()
            suggestionsViewController = SuggestionsViewController(suggestionsViewModel: suggestionViewModel)
            addSection(suggestionsViewController, rentalsView.suggestionsBooksView)
        }
    }
    
    func getRentalsBooks() {
        rentalsViewModel.getRentalsBooks() { [self] in
            let booksViewModel = rentalsViewModel.createBooksViewModel()
            booksViewController = BooksViewController(booksViewModel: booksViewModel)
            addSection(booksViewController, rentalsView.booksView)
        }
    }
    
    private func addSection(_ child: UIViewController, _ viewFrame: UIView) {
        addChild(child)
        viewFrame.addSubview(child.view)
        viewFrame.addSubViewWithConstraints(child: child.view, parent: viewFrame)
        child.didMove(toParent: self)
    }

}
