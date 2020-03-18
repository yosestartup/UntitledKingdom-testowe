//
//  DIResolver+Collection.swift
//  Recruitment-iOS
//
//  Created by Oleksandr Bambuliak on 18/03/2020.
//  Copyright © 2020 Oleksandr Bambuliak. All rights reserved.
//

import UIKit

// MARK: - Collection
protocol CollectionProtocol {
    func presentCollectionViewController() -> UIViewController
}

extension DIResolver: CollectionProtocol {
    func presentCollectionViewController() -> UIViewController {
        let viewController = CollectionViewController()
        let interactor = CollectionInteractor(networkController: self.networkController)
        let wireFrame = CollectionWireFrame(resolver: self)
        let presenter = CollectionPresenter(view: viewController, wireFrame: wireFrame, interactor: interactor)
        viewController.presenter = presenter
        return viewController
    }
}
