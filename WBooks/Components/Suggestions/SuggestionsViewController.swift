//
//  SuggestionsViewController.swift
//  WBooks
//
//  Created by daniel.f.munoz on 6/09/21.
//

import UIKit

class SuggestionsViewController: UIViewController {
    
    private lazy var suggestionView = SuggestionsView()
    private let suggestionsViewModel: SuggestionsViewModel
    
    init(suggestionsViewModel: SuggestionsViewModel) {
        self.suggestionsViewModel = suggestionsViewModel
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        suggestionView.suggestBooks.delegate = self
        suggestionView.suggestBooks.dataSource = self
        getSuggestions()
    }
    
    override func loadView() {
        view = suggestionView
    }
    
    func getSuggestions() {
        suggestionsViewModel.getSuggestions { books in
            if !books.isEmpty {
                self.suggestionView.suggestBooks.reloadData()
            } else {
                self.suggestionView.generalView.isHidden = true
            }
        }
    }
    
}

extension SuggestionsViewController: UICollectionViewDelegate, UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return suggestionsViewModel.suggestions.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: SuggestionsCollectionViewCell.identifier, for: indexPath) as! SuggestionsCollectionViewCell
        cell.setData(suggestionsViewModel.suggestions[indexPath.row])
        return cell
    }

}
