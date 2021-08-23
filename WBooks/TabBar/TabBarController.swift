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
        
        let _libraryViewModel = LibraryViewModel()
        let libraryViewController = LibraryViewController(libraryViewModel: _libraryViewModel)
        let navLibrary = createNavigationItem(controller: libraryViewController,
                                              tag: 0,
                                              title: "TITLE_LIBRARY",
                                              imageUnselect: .libraryUnSelect,
                                              imageSelect: .librarySelect)
        
        let _wishListViewModel = WishlistViewModel()
        let wishListViewController = WishListViewController(wishListViewModel: _wishListViewModel)
        let navWishList = createNavigationItem(controller: wishListViewController,
                                               tag: 1,
                                               title: "TITLE_WISHLIST",
                                               imageUnselect: .wishlistUnSelect,
                                               imageSelect: .wishlistSelect)
        
        let _addNewViewModel = AddNewViewModel()
        let addNewViewController = AddNewViewController(addNewViewModel: _addNewViewModel)
        let navAddNew = createNavigationItem(controller: addNewViewController,
                                             tag: 2,
                                             title: "TITLE_ADDNEW",
                                             imageUnselect: .addNewUnSelect,
                                             imageSelect: .addNewSelect)
        
        let _rentalsViewModel = RentalsViewModel()
        let rentalsViewController = RentalsViewController(rentalsViewModel: _rentalsViewModel)
        let navRentals = createNavigationItem(controller: rentalsViewController,
                                              tag: 3,
                                              title: "TITLE_RENTALS",
                                              imageUnselect: .rentalsUnselect,
                                              imageSelect: .rentalsSelect)
        
        let _settingsViewModel = SettingsViewModel()
        let settingsViewController = SettingsViewController(settingsViewModel: _settingsViewModel)
        let navSettings = createNavigationItem(controller: settingsViewController,
                                               tag: 4,
                                               title: "TITLE_SETTINGS",
                                               imageUnselect: .settingsUnselect,
                                               imageSelect: .settingsSelect)
        
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
