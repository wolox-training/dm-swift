//
//  ExampleViewController.swift
//  WBooks
//
//  Created by diego.a.quiros on 11/08/2021.
//

import UIKit

class ExampleViewController: UIViewController {
    
    private lazy var exampleView = ExampleView()

    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func loadView() {
        view = exampleView
    }

}
