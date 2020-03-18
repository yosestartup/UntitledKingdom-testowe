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
    private var tableView = UITableView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.createUI()

    }
    
    override func viewWillAppear(_ animated: Bool) {
        self.tabBarController?.title = "List"
    }


    private func createUI() {
        self.view.addSubview(self.tableView)
        
        super.title = "List"
        self.tableView.snp.makeConstraints { (make) in
            make.top.bottom.left.right.equalToSuperview()
        }

        
        
    }

    
}
extension TableViewController: TableViewProtocol { }
