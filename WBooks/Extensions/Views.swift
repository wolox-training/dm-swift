//
//  Views.swift
//  WBooks
//
//  Created by daniel.f.munoz on 1/09/21.
//

import Foundation
import UIKit

extension UIView {
    
    func addSubViewWithConstraints(child: UIView, parent: UIView) {
        child.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            child.topAnchor.constraint(equalTo: parent.topAnchor),
            child.bottomAnchor.constraint(equalTo: parent.bottomAnchor),
            child.leadingAnchor.constraint(equalTo: parent.leadingAnchor),
            child.trailingAnchor.constraint(equalTo: parent.trailingAnchor)
        ])
    }
    
}
