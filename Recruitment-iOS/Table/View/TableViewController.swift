//
//  TableViewController.swift
//  Recruitment-iOS
//
//  Created by Oleksandr Bambuliak on 18/03/2020.
//  Copyright © 2020 Oleksandr Bambuliak. All rights reserved.
//

import UIKit
import SnapKit

class TableViewController: BaseViewController {

    var presenter: TablePresenterProtocol!
    private var tableView: UITableView! = UITableView()
    private var dataSource: TableDataSource!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.createUI()
        self.presenter.viewLoaded()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        self.tabBarController?.title = "List"
        if let path = tableView.indexPathForSelectedRow {
            tableView.deselectRow(at: path, animated: true)
        }
    }

    private func createUI() {
        self.view.addSubview(self.tableView)
        
        self.dataSource = TableDataSource()
        self.dataSource.delegate = self
        
        self.tableView.delegate = self
        self.tableView.dataSource = self
        self.tableView.register(UITableViewCell.self, forCellReuseIdentifier: "CellId")
        self.tableView.snp.makeConstraints { (make) in
            make.top.bottom.left.right.equalToSuperview()
        }
    }
    
    func insertModels(models: [ItemModel]) {
        self.dataSource.insertItems(models)
    }
    
    deinit {
        self.presenter = nil
        self.tableView = nil
        self.dataSource = nil
    }
}

extension TableViewController: TableViewProtocol {
    func getModelBy(index: Int) -> ItemModel? {
        self.dataSource.getModelBy(index: index)
    }
}

extension TableViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        self.dataSource.getNumberOfItems(in: section)
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        self.dataSource.getCell(for: tableView, indexPath: indexPath)
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableView.automaticDimension
    }
    
    func tableView(_ tableView: UITableView, estimatedHeightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100.0
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        self.presenter.didClickCellAt(row: indexPath.row)
    }
    
}

extension TableViewController: TableDataSourceDelegate {
    func reloadData() {
        self.tableView.reloadData()
    }
}
