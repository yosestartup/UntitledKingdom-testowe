//
//  DIResolver+StartScreen.swift
//  Recruitment-iOS
//
//  Created by Oleksandr Bambuliak on 18/03/2020.
//  Copyright © 2020 Oleksandr Bambuliak. All rights reserved.
//

import UIKit

// MARK: - StartScreen
protocol StartScreenProtocol {
    func presentStartScreenViewController() -> UIViewController
}

extension DIResolver: StartScreenProtocol {
    func presentStartScreenViewController() -> UIViewController {
        let viewController = StartScreenViewController()
        let interactor = StartScreenInteractor(networkController: self.networkController)
        let wireFrame = StartScreenWireFrame(resolver: self)
        let presenter = StartScreenPresenter(view: viewController, wireFrame: wireFrame, interactor: interactor)
        viewController.presenter = presenter
        return viewController
    }
}
