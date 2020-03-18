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
    private var model: ItemModel
    
    init(model: ItemModel, view: DetailsViewProtocol, wireFrame: DetailsWireFrameProtocol, interactor: DetailsInteractorProtocol) {
        self.view = view
        self.interactor = interactor
        self.wireFrame = wireFrame
        self.model = model
    }
    
    func viewLoaded() {
        self.view?.setBackroundColor(color: model.color)
        self.view?.setTitle(title: getFormatted(title: model.name))
        //self.interactor.
    }
    
    private func getFormatted(title: String) -> String {
        var newTitle = ""
        
        for (index, letter) in title.enumerated() {
              let newLetter = index % 2 == 0 ? String(letter).uppercased() : String(letter).lowercased()
              newTitle += newLetter
        }
        
        return newTitle
    }
}

extension DetailsPresenter: DetailsPresenterProtocol { }
