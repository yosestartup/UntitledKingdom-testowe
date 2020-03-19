//
//  CollectionProtocols.swift
//  Recruitment-iOS
//
//  Created by Oleksandr Bambuliak on 18/03/2020.
//  Copyright © 2020 Oleksandr Bambuliak. All rights reserved.
//

import UIKit

protocol CollectionViewProtocol: class {
    func showOkAlertController(title: String?, message: String?, callback: (() -> Void)?)
    func getModelBy(index: Int) -> ItemData?
    func insertModels(models: [ItemData])
}

protocol CollectionWireFrameProtocol: class {
    func presentDetailsScreen(model: ItemData, from: CollectionViewProtocol?)
}

protocol CollectionPresenterProtocol: class {
    func viewLoaded()
    func didClickCellAt(row: Int)
}

protocol CollectionInteractorProtocol: class {
    func fetchList(completion: @escaping (ItemsListApiResponseModel?, Error?) -> Void)
}

