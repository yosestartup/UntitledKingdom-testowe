//
//  CollectionPresenter.swift
//  Recruitment-iOS
//
//  Created by Oleksandr Bambuliak on 18/03/2020.
//  Copyright © 2020 Oleksandr Bambuliak. All rights reserved.
//

class CollectionPresenter: BasePresenter {

    weak var view: CollectionViewProtocol?
    private var wireFrame: CollectionWireFrameProtocol
    private var interactor: CollectionInteractorProtocol

    init(view: CollectionViewProtocol, wireFrame: CollectionWireFrameProtocol, interactor: CollectionInteractorProtocol) {
        self.view = view
        self.interactor = interactor
        self.wireFrame = wireFrame
    }
}

extension CollectionPresenter: CollectionPresenterProtocol {
    func didClickRow() {
        self.wireFrame.presentDetailsScreen(from: self.view)
    }
}
