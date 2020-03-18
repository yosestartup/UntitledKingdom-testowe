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
    
    private var items = [ItemModel]()
    
    weak var delegate: TableDataSourceDelegate?
    
    func getModelBy(index: Int) -> ItemModel? {
        return items[index]
    }
    
    func getNumberOfItems(in section: Int) -> Int {
        return items.count
    }
    
    func getCell(for tableView: UITableView, indexPath: IndexPath) -> UITableViewCell {
        let cell: UITableViewCell =  UITableViewCell(style: .subtitle, reuseIdentifier: "CellId")
        
        let itemModel = items[indexPath.row]
        cell.backgroundColor = itemModel.color
        cell.textLabel?.text = itemModel.name
        cell.detailTextLabel?.text = itemModel.preview
        cell.detailTextLabel?.numberOfLines = 0
        return cell ?? UITableViewCell()
    }
    
    func insertItems(_ items: [ItemModel]) {
        self.updateWithItems(items)
    }
    
    private func updateWithItems(_ items: [ItemModel]) {
        self.items = items
        DispatchQueue.main.async {
           self.delegate?.reloadData()
       }
    }
    
}
