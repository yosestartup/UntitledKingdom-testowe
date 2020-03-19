//
//  ItemAttributesApiResponseModel.swift
//  Recruitment-iOS
//
//  Created by Oleksandr Bambulyak on 19/03/2020.
//  Copyright © 2020 Untitled Kingdom. All rights reserved.
//

import Foundation

struct ItemAttributesApiResponseModel: Codable {
    var name: String
    var color: String
    var preview: String?
    var desc: String?
}
