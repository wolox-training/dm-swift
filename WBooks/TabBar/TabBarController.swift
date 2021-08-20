//
//  TabBarController.swift
//  WBooks
//
//  Created by daniel.f.munoz on 18/08/21.
//

import UIKit

class TabBarController: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let navLibrary = createNavigationItem(controller: LibraryViewController(), tag: 0, title: "TITLE_LIBRARY", imageUnselect: .libraryUnSelect, imageSelect: .librarySelect)
        
        let navWishList = createNavigationItem(controller: WishListViewController(), tag: 1, title: "TITLE_WISHLIST", imageUnselect: .wishlistUnSelect, imageSelect: .wishlistSelect)
        
        let navAddNew = createNavigationItem(controller: AddNewViewController(), tag: 2, title: "TITLE_ADDNEW", imageUnselect: .addNewUnSelect, imageSelect: .addNewSelect)
        
        let navRentals = createNavigationItem(controller: RentalsViewController(), tag: 3, title: "TITLE_RENTALS", imageUnselect: .rentalsUnselect, imageSelect: .rentalsSelect)
        
        let navSettings = createNavigationItem(controller: SettingsViewController(), tag: 4, title: "TITLE_SETTINGS", imageUnselect: .settingsUnselect, imageSelect: .settingsSelect)
        
        viewControllers = [navLibrary, navWishList, navAddNew, navRentals, navSettings]
    }
    
    func createNavigationItem(controller: UIViewController, tag: Int, title: String, imageUnselect: UIImage, imageSelect: UIImage) -> UINavigationController {
        let navigation = UINavigationController()
        controller.tabBarItem = UITabBarItem()
        controller.tabBarItem.title = NSLocalizedString(title, comment: "").capitalized
        controller.tabBarItem.tag = tag
        controller.tabBarItem.image = imageUnselect
        controller.tabBarItem.selectedImage = imageSelect
        navigation.viewControllers = [controller]
        return navigation
    }
    
}
