//
//  TableProtocols.swift
//  Recruitment-iOS
//
//  Created by Oleksandr Bambuliak on 18/03/2020.
//  Copyright © 2020 Oleksandr Bambuliak. All rights reserved.
//

import UIKit

protocol TableViewProtocol: class {
    func showOkAlertController(title: String?, message: String?, callback: (() -> Void)?)
    func insertModels(models: [ItemData])
    func getModelBy(index: Int) -> ItemData?
}

protocol TableWireFrameProtocol: class {
    func presentDetailsScreen(model: ItemData, from: TableViewProtocol?)
}

protocol TablePresenterProtocol: class {
    func viewLoaded()
    func didClickCellAt(row: Int)
}

protocol TableInteractorProtocol: class {
    func fetchList(completion: @escaping (ItemsListApiResponseModel?, Error?) -> Void)
}

