//
//  DetailsProtocols.swift
//  Recruitment-iOS
//
//  Created by Oleksandr Bambuliak on 18/03/2020.
//  Copyright © 2020 Oleksandr Bambuliak. All rights reserved.
//

import UIKit

protocol DetailsViewProtocol: class {
    func showOkAlertController(title: String?, message: String?, callback: (() -> Void)?)
    func setTitle(with: String)
    func setDescriptionWith(text: String)
    func setBackroundColor(color: UIColor)
}

protocol DetailsWireFrameProtocol: class { }

protocol DetailsPresenterProtocol: class {
    func viewLoaded()
}

protocol DetailsInteractorProtocol: class {
    func fetchItemWith(id: String, completion: @escaping (ItemDetailsModel?) -> Void)
}

