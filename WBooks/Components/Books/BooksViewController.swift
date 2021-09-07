//
//  BooksViewController.swift
//  WBooks
//
//  Created by daniel.f.munoz on 6/09/21.
//

import UIKit

class BooksViewController: UIViewController {
    
    private lazy var booksView = BooksView()
    private let booksViewModel: BooksViewModel
    
    init(booksViewModel: BooksViewModel) {
        self.booksViewModel = booksViewModel
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
    }
    
    override func loadView() {
        view = booksView
    }
    
    func setupView() {
        booksView.tableView.delegate = self
        booksView.tableView.dataSource = self
    }
    
    func reloadTable(){
        booksView.tableView.reloadData()
    }

}

extension BooksViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return booksViewModel.books.count
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableView.automaticDimension
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
                
        let cell = tableView.dequeueReusableCell(withIdentifier: LibraryTableViewCell.identifier, for: indexPath) as! LibraryTableViewCell
        
        cell.setData(booksViewModel.books[indexPath.row])

        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let detailBookViewModel = DetailBookViewModel(book: booksViewModel.books[indexPath.row])
        let detailBookViewController = DetailBookViewController(detailBookViewModel: detailBookViewModel)
        navigationController?.pushViewController(detailBookViewController, animated: true)
    }
    
}

