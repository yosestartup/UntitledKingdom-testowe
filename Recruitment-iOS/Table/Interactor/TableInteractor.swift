//
//  TableInteractor.swift
//  Recruitment-iOS
//
//  Created by Oleksandr Bambuliak on 18/03/2020.
//  Copyright © 2020 Oleksandr Bambuliak. All rights reserved.
//

class TableInteractor: BaseInteractor { }

extension TableInteractor: TableInteractorProtocol {
    func fetchList(completion: @escaping ([ItemModel]?) -> Void) {
        self.networkController.downloadItems(completion: completion)
    }
}


