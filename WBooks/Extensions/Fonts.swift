//
//  Fonts.swift
//  WBooks
//
//  Created by daniel.f.munoz on 13/08/21.
//

import Foundation
import UIKit

extension UIFont {
    
    static var gillSansTitle: UIFont {
        return UIFont.gillSans(size: 16)
    }
    
    static var gillSansSubtitle: UIFont {
        return UIFont.gillSans(size: 14)
    }
    
    static func gillSans(size: CGFloat) -> UIFont {
        return UIFont(name: "Gill Sans", size: size)!
    }
    
}
