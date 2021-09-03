//
//  CustomTextField.swift
//  WBooks
//
//  Created by daniel.f.munoz on 3/09/21.
//

import Foundation
import UIKit

@IBDesignable
open class CustomTextField: UITextField {
        
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    public required init?(coder: NSCoder) {
        super.init(coder: coder)
        config()
    }
    
    func config(borderColor: UIColor = UIColor.lightGray) {
        let border = CALayer()
        let width = CGFloat(2.0)
        border.borderColor = borderColor.cgColor
        border.frame = CGRect(x: 0, y: frame.size.height - width, width:  frame.size.width, height: frame.size.height)
        border.borderWidth = width
        borderStyle = .none
        layer.addSublayer(border)
        layer.masksToBounds = true
        addTarget(self, action: #selector(isValid), for: .editingDidEnd)
    }
    
    public func isValidValue() -> Bool {
        isValid()
        return !text!.isEmpty
    }
    
    @objc func isValid() {
        if text!.isEmpty {
            config(borderColor: UIColor.red)
        } else {
            config(borderColor: UIColor.lightGray)
        }
    }
    
}
