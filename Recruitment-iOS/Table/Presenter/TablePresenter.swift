//
//  TablePresenter.swift
//  Recruitment-iOS
//
//  Created by Oleksandr Bambuliak on 18/03/2020.
//  Copyright © 2020 Oleksandr Bambuliak. All rights reserved.
//

class TablePresenter: BasePresenter {

    weak var view: TableViewProtocol?
    private var wireFrame: TableWireFrameProtocol
    private var interactor: TableInteractorProtocol

    init(view: TableViewProtocol, wireFrame: TableWireFrameProtocol, interactor: TableInteractorProtocol) {
        self.view = view
        self.interactor = interactor
        self.wireFrame = wireFrame
    }
}

extension TablePresenter: TablePresenterProtocol {
    func didClickRow() {
        self.wireFrame.presentDetailsScreen(from: self.view)
    }
}
