//
//  CollectionProtocols.swift
//  Recruitment-iOS
//
//  Created by Oleksandr Bambuliak on 18/03/2020.
//  Copyright © 2020 Oleksandr Bambuliak. All rights reserved.
//

import UIKit

protocol CollectionViewProtocol: class {
    func getModelBy(index: Int) -> ItemModel?
    func insertModels(models: [ItemModel])
}

protocol CollectionWireFrameProtocol: class {
    func presentDetailsScreen(model: ItemModel, from: CollectionViewProtocol?)
}

protocol CollectionPresenterProtocol: class {
    func viewLoaded()
    func didClickCellAt(row: Int)
}

protocol CollectionInteractorProtocol: class {
    func fetchList(completion: @escaping ([ItemModel]?) -> Void)
}

