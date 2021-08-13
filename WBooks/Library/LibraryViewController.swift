//
//  LibraryViewController.swift
//  WBooks
//
//  Created by daniel.f.munoz on 12/08/21.
//

import UIKit

class LibraryViewController: UIViewController {
    
    private lazy var libraryView = LibraryView()
    
    var dataMock : [Book] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        libraryView.tableView.delegate = self
        libraryView.tableView.dataSource = self
        
        dataMock.append(Book.init(title: "Preuba", autor: "Lorem Ipsum is simply dummy text of the printing and typesetting industry.", image: "imageBookMock"))
        dataMock.append(Book.init(title: "Introduccion a navigation controllers", autor: "En nuestra aplicación tenemos", image: "imageBookMock"))
        dataMock.append(Book.init(title: "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged.", autor: "Daniel", image: "imageBookMock"))
        dataMock.append(Book.init(title: "Test", autor: "Test", image: "imageBookMock"))
    }
    
    override func loadView() {
        view = libraryView
    }
    
}
extension LibraryViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return dataMock.count
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableView.automaticDimension
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let libraryTableViewCell = LibraryTableViewCell()
        
        let cell = tableView.dequeueReusableCell(withIdentifier: libraryTableViewCell.identifier, for: indexPath) as! LibraryTableViewCell
        
        cell.setData(dataMock[indexPath.row])
   
        return cell
    }
    
}
