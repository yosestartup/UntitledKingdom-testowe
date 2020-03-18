//
//  TableProtocols.swift
//  Recruitment-iOS
//
//  Created by Oleksandr Bambuliak on 18/03/2020.
//  Copyright © 2020 Oleksandr Bambuliak. All rights reserved.
//

import UIKit

protocol TableViewProtocol: class { }

protocol TableWireFrameProtocol: class {
    func presentDetailsScreen(from: TableViewProtocol?)
}

protocol TablePresenterProtocol: class {
    func didClickRow()
}

protocol TableInteractorProtocol: class { }

