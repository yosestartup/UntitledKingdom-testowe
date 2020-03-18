//
//  TableProtocols.swift
//  Recruitment-iOS
//
//  Created by Oleksandr Bambuliak on 18/03/2020.
//  Copyright © 2020 Oleksandr Bambuliak. All rights reserved.
//

import UIKit

protocol TableViewProtocol: class {
    func insertModels(models: [ItemModel])
    func getModelBy(index: Int) -> ItemModel?
}

protocol TableWireFrameProtocol: class {
    func presentDetailsScreen(model: ItemModel, from: TableViewProtocol?)
}

protocol TablePresenterProtocol: class {
    func viewLoaded()
    func didClickCellAt(row: Int)
}

protocol TableInteractorProtocol: class {
    func fetchList(completion: @escaping ([ItemModel]?) -> Void)
}

