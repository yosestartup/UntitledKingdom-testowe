//
//  ItemsList.swift
//  Recruitment-iOS
//
//  Created by Oleksandr Bambulyak on 19/03/2020.
//  Copyright © 2020 Untitled Kingdom. All rights reserved.
//

import Foundation

class ItemsList {
    var data: [ItemData]
    
    init(data: [ItemData]) {
        self.data = data
    }

    static func convert(from model: ItemsListApiResponseModel) -> ItemsList {
         var convertedItems = [ItemData]()
         for item in model.data {
            convertedItems.append(ItemData.convert(from: item))
         }
        
         let model = ItemsList(data: convertedItems)
         return model
    }
}
