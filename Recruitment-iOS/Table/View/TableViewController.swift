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

    override func viewDidLoad() {
        super.viewDidLoad()
        self.createUI()

    }


    private func createUI() {

    }
}
extension TableViewController: TableViewProtocol { }
