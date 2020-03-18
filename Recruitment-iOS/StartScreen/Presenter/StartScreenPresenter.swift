//
//  StartScreenPresenter.swift
//  Recruitment-iOS
//
//  Created by Oleksandr Bambuliak on 18/03/2020.
//  Copyright © 2020 Oleksandr Bambuliak. All rights reserved.
//

class StartScreenPresenter: BasePresenter {

    weak var view: StartScreenViewProtocol?
    private var wireFrame: StartScreenWireFrameProtocol
    private var interactor: StartScreenInteractorProtocol

    init(view: StartScreenViewProtocol, wireFrame: StartScreenWireFrameProtocol, interactor: StartScreenInteractorProtocol) {
        self.view = view
        self.interactor = interactor
        self.wireFrame = wireFrame
    }
}

extension StartScreenPresenter: StartScreenPresenterProtocol {
    func didClickStartButton() {
        self.wireFrame.presentTabBarScreen(from: self.view)
    }
}
