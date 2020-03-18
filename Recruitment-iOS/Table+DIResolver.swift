//
//  DIResolver+Table.swift
//  Recruitment-iOS
//
//  Created by Oleksandr Bambuliak on 18/03/2020.
//  Copyright © 2020 Oleksandr Bambuliak. All rights reserved.
//

import UIKit

// MARK: - Table
protocol TableProtocol {
    func presentTableViewController() -> UIViewController
}

extension DIResolver: TableProtocol {
    func presentTableViewController() -> UIViewController {
        let viewController = TableViewController()
        let interactor = TableInteractor(networkController: self.networkController)
        let wireFrame = TableWireFrame(resolver: self)
        let presenter = TablePresenter(view: viewController, wireFrame: wireFrame, interactor: interactor)
        viewController.presenter = presenter
        return viewController
    }
}
