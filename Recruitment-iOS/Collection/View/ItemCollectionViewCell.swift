//
//  ItemCollectionViewCell.swift
//  Recruitment-iOS
//
//  Created by Oleksandr Bambulyak on 18/03/2020.
//  Copyright © 2020 Untitled Kingdom. All rights reserved.
//

import Foundation
import UIKit

class ItemCollectionViewCell: UICollectionViewCell {
    
    private var title: UILabel = UILabel()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.createUI()
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func createUI() {
        self.layer.masksToBounds = false
        self.layer.cornerRadius = 8
        self.backgroundColor = .clear
        
        self.contentView.backgroundColor = .clear
        self.contentView.addSubview(title)
        
        self.title.snp.makeConstraints { (make) in
            make.centerX.centerY.equalToSuperview()
        }
    }
    
    func display(model: ItemData) {
        self.title.text = model.attributes.name
        self.backgroundColor = model.attributes.color
    }
}
