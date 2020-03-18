//
//  DetailsPresenter.swift
//  Recruitment-iOS
//
//  Created by Oleksandr Bambuliak on 18/03/2020.
//  Copyright © 2020 Oleksandr Bambuliak. All rights reserved.
//

class DetailsPresenter: BasePresenter {

    weak var view: DetailsViewProtocol?
    private var wireFrame: DetailsWireFrameProtocol
    private var interactor: DetailsInteractorProtocol

    init(view: DetailsViewProtocol, wireFrame: DetailsWireFrameProtocol, interactor: DetailsInteractorProtocol) {
        self.view = view
        self.interactor = interactor
        self.wireFrame = wireFrame
    }
}

extension DetailsPresenter: DetailsPresenterProtocol { }
