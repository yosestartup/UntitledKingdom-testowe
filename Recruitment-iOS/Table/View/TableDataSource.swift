//
//  TableDataSource.swift
//  Recruitment-iOS
//
//  Created by Oleksandr Bambulyak on 18/03/2020.
//  Copyright © 2020 Untitled Kingdom. All rights reserved.
//

import Foundation
import UIKit

protocol TableDataSourceDelegate: class {
    func reloadData()
}

class TableDataSource {
    
    private var items = [ItemData]()
    
    weak var delegate: TableDataSourceDelegate?
    
    func getModelBy(index: Int) -> ItemData? {
        return items[index]
    }
    
    func getNumberOfItems(in section: Int) -> Int {
        return items.count
    }
    
    func getCell(for tableView: UITableView, indexPath: IndexPath) -> UITableViewCell {
        let cell: UITableViewCell =  UITableViewCell(style: .subtitle, reuseIdentifier: "CellId")
        
        let itemData = items[indexPath.row]
        cell.backgroundColor = itemData.attributes.color
        cell.textLabel?.text = itemData.attributes.name
        cell.detailTextLabel?.text = itemData.attributes.preview
        cell.detailTextLabel?.numberOfLines = 0
        return cell ?? UITableViewCell()
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
