//
//  LibraryViewModel.swift
//  WBooks
//
//  Created by daniel.f.munoz on 23/08/21.
//

import Foundation

class LibraryViewModel {
    
    let books: [Book]
    
    init() {
        books = [
            Book(title: "Prueba", autor: "Lorem Ipsum is simply dummy text of the printing and typesetting industry.", image: "imageBookMock"),
            Book(title: "Introduccion a navigation controllers", autor: "En nuestra aplicación tenemos", image: "imageBookMock"),
            Book(title: "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged.", autor: "Daniel", image: "imageBookMock"),
            Book(title: "Test", autor: "Test", image: "imageBookMock")]
    }
    
    func notification(){
        debugPrint("Notificaciones...")
    }
    
    func search(){
        debugPrint("Buscador...")
    }
    
}
