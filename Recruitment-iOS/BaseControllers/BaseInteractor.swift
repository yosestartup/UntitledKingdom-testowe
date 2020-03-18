//
//  BaseInteractor.swift
//  Recruitment-iOS
//
//  Created by Oleksandr Bambuliak on 18/03/2020.
//  Copyright © 2020 Oleksandr Bambuliak. All rights reserved.
//

import UIKit

class BaseInteractor {

    var networkController: NetworkingManager! = nil

    init(networkController: NetworkingManager) {
        self.networkController = networkController
    }
}
