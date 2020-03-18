//
//  TabBarPresenter.swift
//  Recruitment-iOS
//
//  Created by Oleksandr Bambuliak on 18/03/2020.
//  Copyright © 2020 Oleksandr Bambuliak. All rights reserved.
//

class TabBarPresenter: BasePresenter {

    weak var view: TabBarViewProtocol?
    private var wireFrame: TabBarWireFrameProtocol
    private var interactor: TabBarInteractorProtocol

    init(view: TabBarViewProtocol, wireFrame: TabBarWireFrameProtocol, interactor: TabBarInteractorProtocol) {
        self.view = view
        self.interactor = interactor
        self.wireFrame = wireFrame
    }
}

extension TabBarPresenter: TabBarPresenterProtocol { }
