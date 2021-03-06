//
//  CollectionWireFrame.swift
//  Recruitment-iOS
//
//  Created by Oleksandr Bambuliak on 18/03/2020.
//  Copyright © 2020 Oleksandr Bambuliak. All rights reserved.
//

import UIKit

class CollectionWireFrame: BaseWireFrame, CollectionWireFrameProtocol {
    func presentDetailsScreen(model: ItemData, from view: CollectionViewProtocol?) {
        guard let fromView = view as? UIViewController else { return }
        let viewController = self.resolver.presentDetailsViewController(model: model)
        fromView.navigationController?.pushViewController(viewController, animated: true)
    }
}
