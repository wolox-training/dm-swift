//
//  SuggestionsViewModel.swift
//  WBooks
//
//  Created by daniel.f.munoz on 6/09/21.
//

import Foundation

class SuggestionsViewModel {
    
    var suggestions: [Suggestion]
    
    init(suggestions: [Suggestion]) {
        self.suggestions = suggestions
    }
    
    func getSuggestions(action: @escaping ([Suggestion]) -> () ) {
        
        let onSuccess = { (suggestions: [Suggestion]) in
            self.suggestions = suggestions
            action(suggestions)
        }
                
        let onError = { error in
            debugPrint(error)
        }
        
        let repository = SuggestionRepository()
        repository.fetchBooks(onSuccess: onSuccess, onError: onError)
    }
    
}
