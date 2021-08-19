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
        
        let navLibrary = UINavigationController()
        let library = LibraryViewController()
        library.tabBarItem = UITabBarItem()
        library.tabBarItem.title = title
        library.tabBarItem.image = .libraryUnSelect
        library.tabBarItem.selectedImage = .librarySelect
        library.tabBarItem.tag = 0
        library.tabBarItem.title = NSLocalizedString("TITLE_LIBRARY", comment: "").capitalized
        navLibrary.viewControllers = [library]
        
        let navWishList = UINavigationController()
        let wishlist = WishListViewController()
        wishlist.tabBarItem = UITabBarItem()
        wishlist.tabBarItem.title = title
        wishlist.tabBarItem.image = .wishlistUnSelect
        wishlist.tabBarItem.selectedImage = .wishlistSelect
        wishlist.tabBarItem.tag = 1
        wishlist.tabBarItem.title = NSLocalizedString("TITLE_WISHLIST", comment: "").capitalized
        navWishList.viewControllers = [wishlist]
        
        let navAddNew = UINavigationController()
        let addNew = AddNewViewController()
        addNew.tabBarItem = UITabBarItem()
        addNew.tabBarItem.title = title
        addNew.tabBarItem.image = .addNewUnSelect
        addNew.tabBarItem.selectedImage = .addNewSelect
        addNew.tabBarItem.tag = 2
        addNew.tabBarItem.title = NSLocalizedString("TITLE_ADDNEW", comment: "").capitalized
        navAddNew.viewControllers = [addNew]
        
        let navRentals = UINavigationController()
        let rentalsView = RentalsViewController()
        rentalsView.tabBarItem = UITabBarItem()
        rentalsView.tabBarItem.title = title
        rentalsView.tabBarItem.image = .rentalsUnselect
        rentalsView.tabBarItem.selectedImage = .rentalsSelect
        rentalsView.tabBarItem.tag = 3
        rentalsView.tabBarItem.title = NSLocalizedString("TITLE_RENTALS", comment: "").capitalized
        navRentals.viewControllers = [rentalsView]
        
        let navSettings = UINavigationController()
        let settingsView = SettingsViewController()
        settingsView.tabBarItem = UITabBarItem()
        settingsView.tabBarItem.title = title
        settingsView.tabBarItem.image = .settingsUnselect
        settingsView.tabBarItem.selectedImage = .settingsSelect
        settingsView.tabBarItem.tag = 4
        settingsView.tabBarItem.title = NSLocalizedString("TITLE_SETTINGS", comment: "").capitalized
        navSettings.viewControllers = [settingsView]
        
        viewControllers = [navLibrary, navWishList, navAddNew, navRentals, navSettings]
    }
    
}
