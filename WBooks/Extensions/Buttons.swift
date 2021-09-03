//
//  Buttons.swift
//  WBooks
//
//  Created by daniel.f.munoz on 30/08/21.
//

import Foundation
import UIKit

extension UIButton {
    
    private func setupGeneral(_ titleColor: UIColor) {
        setTitleColor(titleColor, for: .normal)
        layer.masksToBounds =  true
        layer.cornerRadius = 20
    }
    
    func withGradient() {
        setupGeneral(.white)
        let gradientLayer = CAGradientLayer()
        gradientLayer.colors = [UIColor.pictonBlue.cgColor, UIColor.downy.cgColor]
        gradientLayer.locations = [0,1]
        gradientLayer.startPoint = CGPoint(x: 0, y: 0)
        gradientLayer.endPoint = CGPoint(x: 1, y: 0)
        gradientLayer.frame = bounds
        layer.insertSublayer(gradientLayer, at: 0)
    }
    
    func backgroundWhite() {
        setupGeneral(UIColor.cornflower)
        layer.borderWidth = 2.0
        layer.borderColor = UIColor.cornflower.cgColor
    }
    
}
