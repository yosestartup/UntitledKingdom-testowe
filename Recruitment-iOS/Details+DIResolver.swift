//
//  DIResolver+Details.swift
//  Recruitment-iOS
//
//  Created by Oleksandr Bambuliak on 18/03/2020.
//  Copyright © 2020 Oleksandr Bambuliak. All rights reserved.
//

import UIKit

// MARK: - Details
protocol DetailsProtocol {
    func presentDetailsViewController() -> UIViewController
}

extension DIResolver: DetailsProtocol {
    func presentDetailsViewController() -> UIViewController {
        let viewController = DetailsViewController()
        let interactor = DetailsInteractor(networkController: self.networkController)
        let wireFrame = DetailsWireFrame(resolver: self)
        let presenter = DetailsPresenter(view: viewController, wireFrame: wireFrame, interactor: interactor)
        viewController.presenter = presenter
        return viewController
    }
}
