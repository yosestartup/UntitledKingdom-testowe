//
//  ItemsDataSource.swift
//  Recruitment-iOS
//
//  Created by Oleksandr Bambulyak on 18/03/2020.
//  Copyright © 2020 Untitled Kingdom. All rights reserved.
//

import Foundation
import UIKit

protocol ItemsDataSourceDelegate: class {
    func reloadData()
}

class ItemsDataSource {
    
    private var items = [ItemData]()

    weak var delegate: ItemsDataSourceDelegate?
    
    func getNumbersOfSections() -> Int {
        return 1
    }

    func getNumberOfItems(at section: Int) -> Int {
        return self.items.count
    }

    func getModelBy(index: Int) -> ItemData? {
        return items[index]
    }

    func getCell(for collectionView: UICollectionView, indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "itemCell", for: indexPath) as? ItemCollectionViewCell else { return UICollectionViewCell() }
        let model = self.items[indexPath.row]
        cell.display(model: model)
        return cell
    }
    
    func insertItems(_ items: [ItemData]) {
        self.updateWithItems(items)
    }
    
    private func updateWithItems(_ items: [ItemData]) {
        self.items = items
        DispatchQueue.main.async {
           self.delegate?.reloadData()
       }
    }
}
