//
//  CommentsViewController.swift
//  WBooks
//
//  Created by daniel.f.munoz on 31/08/21.
//

import UIKit

class CommentsViewController: UIViewController {
    
    private lazy var commentsView = CommentsView()
    private let commentsViewModel: CommentsViewModel
    
    init(commentsViewModel: CommentsViewModel) {
        self.commentsViewModel = commentsViewModel
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        setupTable()
        getComments()
    }
    
    override func loadView() {
        view = commentsView
    }
    
    func setupTable() {
        commentsView.tableView.delegate = self
        commentsView.tableView.dataSource = self
    }
    
    func getComments() {
        commentsViewModel.getComments { comments in
            if comments.count > 0 {
                self.commentsView.tableView.reloadData()
            } else {
                self.commentsView.generalView.isHidden = true
            }
        }
    }

}

extension CommentsViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return commentsViewModel.comments.count
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableView.automaticDimension
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
                
        let cell = tableView.dequeueReusableCell(withIdentifier: CommentsTableViewCell.identifier, for: indexPath) as! CommentsTableViewCell
        
        commentsViewModel.getUserComment(id: commentsViewModel.getIdAuthor(indexPath.row)){ user in
            cell.setData(self.commentsViewModel.comments[indexPath.row], user)
        }
        
        return cell
    }
    
}
