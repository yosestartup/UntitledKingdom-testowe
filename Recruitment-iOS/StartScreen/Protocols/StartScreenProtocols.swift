//
//  StartScreenProtocols.swift
//  Recruitment-iOS
//
//  Created by Oleksandr Bambuliak on 18/03/2020.
//  Copyright © 2020 Oleksandr Bambuliak. All rights reserved.
//

import UIKit

protocol StartScreenViewProtocol: class { }

protocol StartScreenWireFrameProtocol: class {
    func presentTabBarScreen(from: StartScreenViewProtocol?)
}

protocol StartScreenPresenterProtocol: class {
    func didClickStartButton()
}

protocol StartScreenInteractorProtocol: class { }

