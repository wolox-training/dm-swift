//
//  Images.swift
//  WBooks
//
//  Created by daniel.f.munoz on 17/08/21.
//

import Foundation
import UIKit

extension UIImage {
    
    static var search: UIImage {
        return UIImage(named: "search")!
    }
    
    static var notification: UIImage {
        return UIImage(named: "notification")!
    }
    
    static var librarySelect: UIImage {
        return UIImage(named: "tabBarLibrarySelect")!
    }
    
    static var libraryUnSelect: UIImage {
        return UIImage(named: "tabBarLibraryUnselect")!
    }
    
    static var wishlistSelect: UIImage {
        return UIImage(named: "tabBarWishlistSelect")!
    }
    
    static var wishlistUnSelect: UIImage {
        return UIImage(named: "tabBarWishlistUnSelect")!
    }
    
    static var addNewSelect: UIImage {
        return UIImage(named: "tabBarAddNewSelect")!
    }
    
    static var addNewUnSelect: UIImage {
        return UIImage(named: "tabBarAddNewUnSelect")!
    }
    
    static var rentalsSelect: UIImage {
        return UIImage(named: "tabBarRentalsSelect")!
    }
    
    static var rentalsUnselect: UIImage {
        return UIImage(named: "tabBarRentalsUnselect")!
    }
    
    static var settingsSelect: UIImage {
        return UIImage(named: "tabBarSettingsSelect")!
    }
    
    static var settingsUnselect: UIImage {
        return UIImage(named: "tabBarSettingsUnselect")!
    }
    
    static var bookDefault: UIImage {
        return UIImage(named: "imageBookMock")!
    }
    
    static var blueButton: UIImage {
        return UIImage(named: "blueButton")!
    }
    
}

extension UIImageView {
    
    public func imageFromUrl(urlString: String) {
        if let url = URL(string: urlString.replacingOccurrences(of: "http", with: "https")) {
            let task = URLSession.shared.dataTask(with: url) { data, response, error in
                guard let data = data, error == nil else {
                    DispatchQueue.main.async {
                        self.image = .bookDefault
                    }
                    return
                }
                DispatchQueue.main.async {
                    self.image = UIImage(data: data)
                }
            }
            task.resume()
        }
    }
    
}
