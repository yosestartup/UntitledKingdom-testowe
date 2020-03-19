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
    func didClickCellAt(row: Int) {
        if let model = self.view?.getModelBy(index: row) {
            self.wireFrame.presentDetailsScreen(model: model, from: self.view)
        }
    }
    
    func viewLoaded() {
        self.interactor.fetchList { model,error  in
            if let error = error {
                self.view?.showOkAlertController(title: "Error", message: error.localizedDescription, callback: nil)
                return
            }
            
            if let model = model {
                let convertedItems = ItemData.convert(from: model.data)
                self.view?.insertModels(models: convertedItems ?? [])
            }
        }
    }

}
