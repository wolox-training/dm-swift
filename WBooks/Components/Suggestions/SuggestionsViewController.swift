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
        getSuggestions()
    }
    
    override func loadView() {
        view = suggestionView
    }
    
    func getSuggestions() {
        suggestionsViewModel.getSuggestions { suggestions in
            if !suggestions.isEmpty {
                print(suggestions)
            } else {
                self.suggestionView.generalView.isHidden = true
            }
        }
    }

}
