//
//  TableWireFrame.swift
//  Recruitment-iOS
//
//  Created by Oleksandr Bambuliak on 18/03/2020.
//  Copyright © 2020 Oleksandr Bambuliak. All rights reserved.
//

import UIKit

class TableWireFrame: BaseWireFrame, TableWireFrameProtocol {
    func presentDetailsScreen(from view: TableViewProtocol?) {
        guard let fromView = view as? UIViewController else { return }
        let viewController = self.resolver.presentDetailsViewController()
        fromView.navigationController?.pushViewController(viewController, animated: true)
    }
}
