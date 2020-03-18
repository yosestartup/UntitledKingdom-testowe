//
//  DetailsProtocols.swift
//  Recruitment-iOS
//
//  Created by Oleksandr Bambuliak on 18/03/2020.
//  Copyright © 2020 Oleksandr Bambuliak. All rights reserved.
//

import UIKit

protocol DetailsViewProtocol: class {
    func setTitle(title: String)
    func setBackroundColor(color: UIColor)
}

protocol DetailsWireFrameProtocol: class { }

protocol DetailsPresenterProtocol: class {
    func viewLoaded()
}

protocol DetailsInteractorProtocol: class { }

