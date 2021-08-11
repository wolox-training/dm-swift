//
//  ExampleView.swift
//  WBooks
//
//  Created by diego.a.quiros on 11/08/2021.
//

import Foundation
import UIKit

final class ExampleView: NibView {
    
    @IBOutlet weak var exampleTitleLabel: UILabel! {
        didSet {
            exampleTitleLabel.textColor = .blue
        }
    }
}
