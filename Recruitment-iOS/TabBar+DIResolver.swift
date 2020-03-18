//
//  DIResolver+TabBar.swift
//  Recruitment-iOS
//
//  Created by Oleksandr Bambuliak on 18/03/2020.
//  Copyright © 2020 Oleksandr Bambuliak. All rights reserved.
//

import UIKit

// MARK: - TabBar
protocol TabBarProtocol {
    func presentTabBarViewController(resolver: DIResolver) -> UIViewController
}

extension DIResolver: TabBarProtocol {
    func presentTabBarViewController(resolver: DIResolver) -> UIViewController {
        let viewController = TabBarViewController(resolver: resolver)
        let interactor = TabBarInteractor(networkController: self.networkController)
        let wireFrame = TabBarWireFrame(resolver: self)
        let presenter = TabBarPresenter(view: viewController, wireFrame: wireFrame, interactor: interactor)
        viewController.presenter = presenter
        return viewController
    }
}
