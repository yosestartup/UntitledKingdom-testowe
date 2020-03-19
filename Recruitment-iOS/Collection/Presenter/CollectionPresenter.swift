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
                self.view?.insertModels(models: convertedItems)
            }
        }
    }
    
}
