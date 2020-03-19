//
//  CollectionInteractor.swift
//  Recruitment-iOS
//
//  Created by Oleksandr Bambuliak on 18/03/2020.
//  Copyright © 2020 Oleksandr Bambuliak. All rights reserved.
//

class CollectionInteractor: BaseInteractor { }

extension CollectionInteractor: CollectionInteractorProtocol {
    func fetchList(completion: @escaping (ItemsListApiResponseModel?, Error?) -> Void) {
        self.networkController.downloadItems(completion: completion)
    }
}
