//
//  DetailsInteractor.swift
//  Recruitment-iOS
//
//  Created by Oleksandr Bambuliak on 18/03/2020.
//  Copyright © 2020 Oleksandr Bambuliak. All rights reserved.
//

class DetailsInteractor: BaseInteractor { }

extension DetailsInteractor: DetailsInteractorProtocol {
    func fetchItemWith(id: String, completion: @escaping (ItemDetailsModel?) -> Void) {
        self.networkController.downloadItemWithID(id, completion: completion)
    }
}
