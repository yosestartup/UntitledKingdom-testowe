//
//  CollectionProtocols.swift
//  Recruitment-iOS
//
//  Created by Oleksandr Bambuliak on 18/03/2020.
//  Copyright © 2020 Oleksandr Bambuliak. All rights reserved.
//

import UIKit

protocol CollectionViewProtocol: class { }

protocol CollectionWireFrameProtocol: class {
    func presentDetailsScreen(model: ItemModel, from: CollectionViewProtocol?)
}

protocol CollectionPresenterProtocol: class {
    func didClickRow()
}

protocol CollectionInteractorProtocol: class { }

