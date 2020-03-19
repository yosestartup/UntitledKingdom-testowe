//
//  ItemAttributes.swift
//  Recruitment-iOS
//
//  Created by Oleksandr Bambulyak on 19/03/2020.
//  Copyright © 2020 Untitled Kingdom. All rights reserved.
//

import Foundation
import UIKit

class ItemAttributes {
    var name: String = ""
    var color: UIColor = UIColor.white
    var preview: String?
    var desc: String?
    
    init(name: String, color: UIColor, preview: String, desc: String) {
        self.name = name
        self.color = color
        self.preview = preview
        self.desc = desc
    }
    
    static func convert(from model: ItemAttributesApiResponseModel) -> ItemAttributes {
          let color: UIColor!
            switch model.color {
                case "Red": color = UIColor.red
                case "Green": color = UIColor.green
                case "Blue": color = UIColor.blue
                case "Yellow": color = UIColor.yellow
                case "Purple": color = UIColor.purple
                default: color = UIColor.black
            }
        
          let model = ItemAttributes(name: model.name,
                                       color: color,
                                       preview: model.preview ?? "",
                                       desc: model.desc ?? ""
                                       )
          return model
      }
}
