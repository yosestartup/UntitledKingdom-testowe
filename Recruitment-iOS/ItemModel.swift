//
//  Item.swift
//  Recruitment-iOS
//
//  Created by Oleksandr Bambulyak on 19/03/2020.
//  Copyright © 2020 Untitled Kingdom. All rights reserved.
//

import Foundation

class ItemModel {
    var data: ItemData

    init(data: ItemData) {
        self.data = data
    }
    
    static func convert(from model: ItemApiResponseModel) -> ItemModel {
        let itemData = ItemData.convert(from: model.data)
        let model = ItemModel(data: itemData)
        return model
    }
    
    static func convert(from items: [ItemApiResponseModel]) -> [ItemModel] {
        var models = [ItemModel]()
        items.forEach { models.append(ItemModel.convert(from: $0)) }
        return models
    }
    
}

class ItemData {
    var id: String = ""
    var type: String = ""
    var attributes: ItemAttributes
    
    init(id: String, type: String, attributes: ItemAttributes) {
        self.id = id
        self.type = type
        self.attributes = attributes
    }
    
    static func convert(from model: ItemDataApiResponseModel) -> ItemData {
         let attributes = ItemAttributes.convert(from: model.attributes)
         let model = ItemData(id: model.id,
                          type: model.type,
                          attributes: attributes)
         return model
    }
    
    static func convert(from items: [ItemDataApiResponseModel]) -> [ItemData] {
         var models = [ItemData]()
         items.forEach { models.append(ItemData.convert(from: $0)) }
         return models
    }
}
