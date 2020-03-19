//
//  ItemApiResponseModel.swift
//  Recruitment-iOS
//
//  Created by Oleksandr Bambulyak on 19/03/2020.
//  Copyright © 2020 Untitled Kingdom. All rights reserved.
//

import Foundation

struct ItemDataApiResponseModel: Codable {
    var id: String
    var type: String
    var attributes: ItemAttributesApiResponseModel
}

