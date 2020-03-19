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
    private var model: ItemData
    
    init(model: ItemData, view: DetailsViewProtocol, wireFrame: DetailsWireFrameProtocol, interactor: DetailsInteractorProtocol) {
        self.view = view
        self.interactor = interactor
        self.wireFrame = wireFrame
        self.model = model
    }
    
    func viewLoaded() {
        self.view?.setBackroundColor(color: model.attributes.color)
        self.view?.setTitle(with: getFormatted(title: model.attributes.name))
        self.interactor.fetchItemWith(id: model.id) { model, error in
            
               if let error = error {
                 self.view?.showOkAlertController(title: "Error", message: error.localizedDescription, callback: nil)
                 return
               }
                 
               if let model = model {
                let convertedItem = ItemModel.convert(from: model)
                self.view?.setDescriptionWith(text: convertedItem.data.attributes.desc ?? "")
                return
               
            }
           
            self.view?.showOkAlertController(title: "Error", message: "Unexpected error", callback: nil)
        }
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
