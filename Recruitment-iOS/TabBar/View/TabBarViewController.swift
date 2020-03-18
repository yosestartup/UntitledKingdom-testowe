//
//  TabBarViewController.swift
//  Recruitment-iOS
//
//  Created by Oleksandr Bambuliak on 18/03/2020.
//  Copyright © 2020 Oleksandr Bambuliak. All rights reserved.
//

import UIKit
import SnapKit

class TabBarViewController: UITabBarController {

    var presenter: TabBarPresenterProtocol!

    private var resolver: DIResolver! = nil

    init(resolver: DIResolver) {
        self.resolver = resolver

        super.init(nibName: nil, bundle: nil)
        self.viewControllers = self.getControllers()
    }

    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.createUI()
    }


    private func createUI() {
        self.navigationController?.setNavigationBarHidden(false, animated: true)
        self.view.backgroundColor = UIColor.white
    }
    
    private func getControllers() -> [UIViewController] {
        let tableController = self.resolver.presentTableViewController()
        let tableButton = UITabBarItem.init(title: "Table", image: nil, selectedImage: nil)
        tableButton.tag = 1
        tableController.tabBarItem = tableButton
        
        let collectionController = self.resolver.presentCollectionViewController()
        let collectionButton = UITabBarItem.init(title: "Collection", image: nil, selectedImage: nil)
        collectionButton.tag = 2
        collectionController.tabBarItem = collectionButton
        
        return [tableController, collectionController]
    }
}
extension TabBarViewController: TabBarViewProtocol { }
