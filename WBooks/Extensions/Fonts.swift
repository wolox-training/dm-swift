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
    
    static var KailasaBoldTitle: UIFont {
        return UIFont.KailasaBold(size: 16)
    }
    
    static var gillSansBoldTitle: UIFont {
        return UIFont.gillSansBold(size: 20)
    }
    
    static var gillSansBoldSubtitle: UIFont {
        return UIFont.gillSansBold(size: 15)
    }
    
    static func gillSans(size: CGFloat) -> UIFont {
        return UIFont(name: "Gill Sans", size: size)!
    }
    
    static func KailasaBold(size: CGFloat) -> UIFont {
        return UIFont(name: "Kailasa Bold", size: size)!
    }
    
    static func gillSansBold(size: CGFloat) -> UIFont {
        return UIFont(name: "Gill Sans Bold", size: size)!
    }
    
}
