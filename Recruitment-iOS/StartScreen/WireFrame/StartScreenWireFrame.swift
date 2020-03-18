//
//  StartScreenWireFrame.swift
//  Recruitment-iOS
//
//  Created by Oleksandr Bambuliak on 18/03/2020.
//  Copyright © 2020 Oleksandr Bambuliak. All rights reserved.
//

import UIKit

class StartScreenWireFrame: BaseWireFrame, StartScreenWireFrameProtocol {
    func presentTabBarScreen(from view: StartScreenViewProtocol?) {
        guard let fromView = view as? UIViewController else { return }
        let viewController = self.resolver.presentTabBarViewController(resolver: self.resolver)
        fromView.navigationController?.pushViewController(viewController, animated: true)
    }
}
