//
//  LibraryViewController.swift
//  WBooks
//
//  Created by daniel.f.munoz on 12/08/21.
//

import UIKit

class LibraryViewController: UIViewController {
    
    private lazy var libraryView = LibraryView()
    private let _libraryViewModel: LibraryViewModel
    
    init(libraryViewModel: LibraryViewModel) {
        _libraryViewModel = libraryViewModel
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        libraryView.tableView.delegate = self
        libraryView.tableView.dataSource = self
        navigationController?.navigationBar.topItem?.title = NSLocalizedString("TITLE_LIBRARY", comment: "")
        navigationItem.leftBarButtonItem = UIBarButtonItem(image: .notification, style: .plain, target: self, action: #selector(notificationPress))
        navigationItem.rightBarButtonItem = UIBarButtonItem(image: .search, style: .plain, target: self, action: #selector(searchPress))
    }
    
    override func loadView() {
        view = libraryView
    }
    
    @objc func notificationPress() {
        _libraryViewModel.notification()
    }
    
    @objc func searchPress() {
        _libraryViewModel.search()
    }
    
}

extension LibraryViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return _libraryViewModel.books.count
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableView.automaticDimension
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
                
        let cell = tableView.dequeueReusableCell(withIdentifier: LibraryTableViewCell.identifier, for: indexPath) as! LibraryTableViewCell
        
        cell.setData(_libraryViewModel.books[indexPath.row])

        return cell
    }
    
}
